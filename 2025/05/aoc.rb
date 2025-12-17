#!/usr/bin/env ruby

fresh, available = ARGF.read.split("\n\n")

fresh_range_ids = fresh.split("\n").map do |line|
  min, max = line.split("-").map(&:to_i)
  (min..max)
end

available_ids = available.split("\n").map(&:to_i)

def puzzle1(fresh_range_ids, available_ids)
  available_ids.count do |id|
    fresh_range_ids.any? { |range| range.include?(id) }
  end
end

def puzzle2(input)
  sorted = input.sort_by(&:begin)
  merged = []

  sorted.each do |range|
    if merged.empty? || merged.last.end < range.begin - 1
      merged << range
    else
      merged[-1] = (merged[-1].begin..[merged[-1].end, range.end].max)
    end
  end
  merged.sum { |range| range.end - range.begin + 1 }
end

puts "Puzzle 1: #{puzzle1(fresh_range_ids, available_ids)}"
puts "Puzzle 2: #{puzzle2(fresh_range_ids)}"
