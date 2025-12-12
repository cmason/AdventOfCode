#!/usr/bin/env ruby

sum = 0
sum2 = 0
$stdin.read.split(",").each do |range_pair|
  start_num, end_num = range_pair.split("-").map(&:to_i)
  sum += (start_num..end_num).filter do |n|
    mid = n.to_s.length / 2
    left, right = n.to_s.slice(0, mid), n.to_s.slice(mid, n.to_s.length)
    left == right
  end.sum
  sum2 += (start_num..end_num).filter { |n| n.to_s.match?(/^(.+)\1+$/) }.sum
end

puts "Puzzle 1: #{sum}"
puts "Puzzle 2: #{sum2}"
