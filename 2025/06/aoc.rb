#!/usr/bin/env ruby

input = ARGF.read.lines.map(&:chomp)

def puzzle1(input)
  matrix = input.map { |line| line.split }.transpose.map(&:reverse)
  matrix.sum do |row|
    if row[0] == "*"
      row[1..].map(&:to_i).inject(:*)
    elsif row[0] == "+"
      row[1..].map(&:to_i).sum
    else
      0
    end
  end
end

def puzzle2(input)
  matrix = input[0...-1].map { |line| line.chars }
  ops = input.last.chars

  transposed = matrix.transpose.map(&:join)
  ops_iter = ops.select { |c| c =~ /[+*]/ }.each
  filled_ops = transposed.map { |col| col.strip.empty? ? ops_iter.next : col }
  group = []
  filled_ops.each_with_object([]) do |item, acc|
    if item.match?(/[+*]/)
      nums = group.map(&:to_i)
      acc << (item == "*" ? nums.inject(:*) : nums.sum)
      group = []
    else
      group << item.to_i
    end
  end.sum
end

puts "Puzzle 1: #{puzzle1(input)}"
puts "Puzzle 2: #{puzzle2(input)}"
