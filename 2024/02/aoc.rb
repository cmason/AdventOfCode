#!/usr/bin/env ruby

number_of_safe_reports = 0
number_of_safe_reports_with_dampening = 0

def safe?(levels)
  differences = levels.each_cons(2).map { |a, b| a - b }
  decreasing = differences.all? { |diff| diff.between?(1, 3) }
  increasing = differences.all? { |diff| diff.between?(-3, -1) }
  decreasing || increasing
end

def safe_with_dampening?(levels)
  return true if safe?(levels)

  (0...levels.size).each do |i|
    new_levels = levels.dup
    new_levels.delete_at(i)
    return true if safe?(new_levels)
  end

  false
end

$stdin.each_line do |line|
  levels = line.split.map(&:to_i)
  number_of_safe_reports += 1 if safe?(levels)
  number_of_safe_reports_with_dampening += 1 if safe_with_dampening?(levels)
end

puts "Safe: #{number_of_safe_reports}"
puts "Safe with dampening: #{number_of_safe_reports_with_dampening}"
