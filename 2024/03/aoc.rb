#!/usr/bin/env ruby

INSTRUCTION_REGEX = /mul\((\d{1,3}),(\d{1,3})\)/
input = ARGF.read

def sum_of_products(string)
  string.scan(INSTRUCTION_REGEX).map { |x, y| x.to_i * y.to_i }.sum
end
puts "Puzzle 1: #{sum_of_products(input)}"

cond = input.gsub(/don't\(\).*?do\(\)/m, "")
puts "Puzzle 2: #{sum_of_products(cond)}"
