#!/usr/bin/env ruby

lines = $stdin.each_line.map(&:chomp)

total = lines.map do |line|
  bank = line.chomp.chars
  val, idx = bank[0..-2].each_with_index.max_by { |v, i| [v, -i] }
  [val, bank[idx + 1..].max].join.to_i
end.sum
puts "Puzzle 1: #{total}"

total = lines.map do |line|
  line.chomp!
  target_length = 12
  stack = []
  to_remove = line.length - target_length
  line.chars.each do |c|
    while to_remove > 0 && !stack.empty? && stack[-1] < c
      stack.pop
      to_remove -= 1
    end
    stack << c
  end

  stack[0, target_length].join.to_i
end.sum

puts "Puzzle 2: #{total}"
