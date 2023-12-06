#!/usr/bin/env ruby

PRIORITIES = ('a'..'z').to_a + ('A'..'Z').to_a
priorities = $stdin.each_line.map do |rucksack|
  first, last = rucksack.chars.each_slice(rucksack.length / 2).to_a
  dupes = first.intersection(last)
  dupes.inject(0) { |sum, item| sum + PRIORITIES.index(item) + 1 }
end

puts priorities.sum
