#!/usr/bin/env ruby

def sections_to_range(sections)
  start, finish = sections.split("-").map(&:to_i)
  (start..finish)
end

def covered?(range1, range2)
  range1.cover?(range2) || range2.cover?(range1)
end

covered_pairs = $stdin.each_line.count do |section_pairs|
  pair1, pair2  = section_pairs.split(",")
  covered?(sections_to_range(pair1), sections_to_range(pair2))
end

puts covered_pairs
