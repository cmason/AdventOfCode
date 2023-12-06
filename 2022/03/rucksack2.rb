#!/usr/bin/env ruby

PRIORITIES = ("a".."z").to_a + ("A".."Z").to_a
priorities = $stdin.each_line.each_slice(3).map do |rucksack|
  first, *rest = rucksack.map { |items| items.chomp.chars }
  first.intersection(*rest).inject(0) { |sum, item| sum + PRIORITIES.index(item) + 1 }
end

puts priorities.sum
