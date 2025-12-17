#!/usr/bin/env ruby

input = ARGF.read.lines.map(&:chomp)

def puzzle1(input)
  rows = input.size
  cols = input[0].size
  deltas = [-1, 0, 1].product([-1, 0, 1]) - [[0, 0]]

  accessible = 0
  rows.times do |r|
    cols.times do |c|
      next unless input[r][c] == "@"
      neighbors = deltas.count do |dr, dc|
        nr, nc = r + dr, c + dc
        nr.between?(0, rows - 1) && nc.between?(0, cols - 1) && input[nr][nc] == "@"
      end
      accessible += 1 if neighbors < 4
    end
  end

  accessible
end

def puzzle2(input)
  grid = input.map(&:dup)
  rows = grid.size
  cols = grid[0].size
  deltas = [-1, 0, 1].product([-1, 0, 1]) - [[0, 0]]

  accessible = 0

  loop do
    to_remove = []
    rows.times do |r|
      cols.times do |c|
        next unless grid[r][c] == "@"
        neighbors = deltas.count do |dr, dc|
          nr, nc = r + dr, c + dc
          nr.between?(0, rows - 1) && nc.between?(0, cols - 1) && grid[nr][nc] == "@"
        end
        to_remove << [r, c] if neighbors < 4
      end
    end
    break if to_remove.empty?
    accessible += to_remove.size
    to_remove.each { |r, c| grid[r][c] = "x" }
  end

  accessible
end

puts "Puzzle 1: #{puzzle1(input)}"
puts "Puzzle 2: #{puzzle2(input)}"
