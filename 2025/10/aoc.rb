#!/usr/bin/env ruby

require "bundler/inline"

gemfile do
  source "https://rubygems.org"
  gem "z3"
end

input = ARGF.read.lines.map(&:chomp)

def parse_machine(line)
  # Extract indicator lights pattern
  lights_match = line.match(/\[([.#]+)\]/)
  target = lights_match[1].chars.map { |c| (c == "#") ? 1 : 0 }

  # Extract button configurations
  buttons = line.scan(/\(([0-9,]+)\)/).map do |match|
    match[0].split(",").map(&:to_i)
  end
  {target: target, buttons: buttons}
end

def solve_machine(machine)
  target = machine[:target]
  buttons = machine[:buttons]
  n_buttons = buttons.length

  # We need to solve: matrix * x = target (mod 2)
  # where x[i] is the number of times we press button i (mod 2)

  # Try all possible combinations (2^n_buttons possibilities)
  # This is brute force but works for reasonable button counts
  min_presses = Float::INFINITY

  (0...(1 << n_buttons)).each do |combo|
    # combo represents which buttons to press (odd number of times)
    result = Array.new(target.length, 0)
    press_count = 0

    n_buttons.times do |j|
      if combo & (1 << j) != 0
        # Press this button (odd number of times, so effectively once in mod 2)
        buttons[j].each do |light_idx|
          result[light_idx] ^= 1
        end
        press_count += 1
      end
    end

    if result == target
      min_presses = [min_presses, press_count].min
    end
  end

  (min_presses == Float::INFINITY) ? nil : min_presses
end

def puzzle1(input)
  total = 0
  input.each do |line|
    next if line.strip.empty?
    machine = parse_machine(line)
    presses = solve_machine(machine)
    total += presses if presses
  end
  total
end

def parse_machine_joltage(line)
  # Extract button configurations
  buttons = line.scan(/\(([0-9,]+)\)/).map do |match|
    match[0].split(",").map(&:to_i)
  end

  # Extract joltage requirements
  joltage_match = line.match(/\{([0-9,]+)\}/)
  target = joltage_match[1].split(",").map(&:to_i)

  {target: target, buttons: buttons}
end

def solve_joltage(machine)
  target = machine[:target]
  buttons = machine[:buttons]
  n_counters = target.length
  n_buttons = buttons.length

  # Use Z3 to solve the integer linear programming problem
  # We want to minimize sum(x_i) subject to Ax = b, x >= 0

  solver = Z3::Optimize.new

  # Create integer variables for button presses
  button_vars = n_buttons.times.map { |i| Z3.Int("button_#{i}") }

  # Add constraints: each button press count >= 0
  button_vars.each { |var| solver.assert(var >= 0) }

  # Add constraints: for each counter, sum of button presses affecting it = target
  n_counters.times do |i|
    counter_sum = nil
    buttons.each_with_index do |button, j|
      if button.include?(i)
        counter_sum = if counter_sum.nil?
          button_vars[j]
        else
          counter_sum + button_vars[j]
        end
      end
    end

    # If no buttons affect this counter
    if counter_sum.nil?
      return Float::INFINITY if target[i] != 0
    else
      solver.assert(counter_sum == target[i])
    end
  end

  # Minimize total button presses
  total_presses = button_vars.reduce { |sum, var| sum + var }
  solver.minimize(total_presses)

  # Solve
  if solver.satisfiable?
    model = solver.model
    button_vars.sum { |var| model[var].to_i }
  else
    Float::INFINITY
  end
end

def puzzle2(input)
  total = 0
  input.each do |line|
    next if line.strip.empty?
    machine = parse_machine_joltage(line)
    presses = solve_joltage(machine)
    total += presses if presses && presses != Float::INFINITY
  end
  total
end

puts "Puzzle 1: #{puzzle1(input)}"
puts "Puzzle 2: #{puzzle2(input)}"
