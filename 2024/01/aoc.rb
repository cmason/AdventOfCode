#!/usr/bin/env ruby

list1, list2 = [], []
$stdin.each_line do |line|
  num1, num2 = line.split.map(&:to_i)
  list1 << num1
  list2 << num2
end

def distance(list1, list2)
  list1.sort.zip(list2.sort).sum { |a, b| (a - b).abs }
end

def similarity(list1, list2)
  tally = list2.tally
  list1.sum { |a| a * tally.fetch(a, 0) }
end

puts "Total distance: #{distance(list1, list2)}"
puts "Similarity score: #{similarity(list1, list2)}"
