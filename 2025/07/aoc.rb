#!/usr/bin/env ruby

input = ARGF.read.lines.map(&:chomp)

def puzzle1(grid)
  rows = grid.size
  cols = grid[0].size
  start_col = grid[0].index("S")
  beams = [[1, start_col]]
  split_count = 0
  visited = Array.new(rows) { Array.new(cols, false) }

  until beams.empty?
    r, c = beams.pop
    next if r >= rows || c < 0 || c >= cols
    next if visited[r][c]
    visited[r][c] = true

    case grid[r][c]
    when "."
      beams << [r + 1, c]
    when "^"
      split_count += 1
      beams << [r, c - 1]
      beams << [r, c + 1]
    end
  end

  split_count
end

def puzzle2(grid)
  rows = grid.size
  cols = grid[0].size
  start_col = grid[0].index("S")
  memo = {}

  dfs = lambda do |r, c|
    return 0 if r < 0 || c < 0 || r >= rows || c >= cols
    return 1 if r == rows - 1 # reached bottom row
    key = [r, c]
    return memo[key] if memo.key?(key)

    result =
      case grid[r][c]
      when "."
        dfs.call(r + 1, c)
      when "^"
        dfs.call(r, c - 1) + dfs.call(r, c + 1)
      else
        0
      end

    memo[key] = result
  end

  dfs.call(1, start_col)
end

puts "Puzzle 1: #{puzzle1(input)}"
puts "Puzzle 2: #{puzzle2(input)}"
