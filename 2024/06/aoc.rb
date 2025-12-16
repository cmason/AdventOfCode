#!/usr/bin/env ruby

grid = []
start = nil
direction = [[-1, 0], [0, 1], [1, 0], [0, -1]] # up, right, down, left

ARGF.each_with_index do |line, row|
  grid_row = line.chomp.chars.map.with_index do |char, col|
    case char
    when "^"
      start = [row, col]
      1
    when "#"
        0
    else
      nil
    end
  end
  grid << grid_row
end

def inbounds?(point, height, width)
  (0...height).cover?(point.first) && (0...width).cover?(point.last)
end

height = grid.size
width = grid.first.size
dir = 0
pos = start
puts "start: #{start}"
puts "grid: #{grid}"
while inbounds?(pos, height, width)
  next_pos = pos.map.with_index { |x, i| x + direction[dir][i] }
  puts "next_pos: #{next_pos}"
  if (inbounds?(next_pos, height, width) && grid[next_pos.first][next_pos.last] == 0)
    dir = (dir + 1) % 4
  else
    pos = next_pos
    grid[pos[0]][pos[1]] = 1
  end
end
p grid
puts "Puzzle 1: #{grid.flat_map(&:compact).sum}"
puts "Puzzle 2: ???"
end
