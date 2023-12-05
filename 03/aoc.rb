#!/usr/bin/env ruby

schematic = STDIN.readlines.map { |line| ".#{line.chomp}." }
schematic = schematic.push("." * schematic.length).unshift("." * schematic.length)

def symbol?(input)
  input.match?(/[^\d.]/)
end

def near_symbol?(start_pos, end_pos, line, schematic)
  (line -1..line + 1).any? { |l| symbol?(schematic[l][start_pos -1..end_pos]) }
end

def build_gear(matchData, line, gears, schematic)
  start_pos, end_pos = matchData.offset(0)
  (line - 1..line + 1).each do |l|
    schematic[l].gsub(/\*/).map { Regexp.last_match }.each do |match|
      if match.offset(0)[0].between?(start_pos -1, end_pos)
        gears[[match.offset(0), l]] << matchData[0].to_i
      end
    end

  end
end

parts_sum = 0
gears = Hash.new { |h, k| h[k] = []}
(1..schematic.length - 2).each do |row|
  schematic[row].gsub(/\d+/).map { Regexp.last_match }.each do |match|
    parts_sum += match[0].to_i if near_symbol?(*match.offset(0), row, schematic)
    build_gear(match, row, gears, schematic)
  end
end
gears_sum = gears.values.select { |v| v.size == 2 }.sum { |v| v.reduce(:*) }
puts "Part numbers sum: #{parts_sum}"
puts "Gear ratio sum: #{gears_sum}"
