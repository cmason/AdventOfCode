#!/usr/bin/env ruby

def num_words_at_coord?(grid, row, col, word)
  rows = grid.length
  cols = grid[0].length
  count = 0
  return count if grid[row][col] != word[0]

  len_word = word.length

  x = [-1, -1, -1, 0, 0, 1, 1, 1]
  y = [-1, 0, 1, -1, 1, -1, 0, 1]

  (0...8).each do |dir|
    curr_x, curr_y = row + x[dir], col + y[dir]
    k = 1

    while k < len_word
      break if curr_x >= rows || curr_x < 0 || curr_y >= cols || curr_y < 0
      break if grid[curr_x][curr_y] != word[k]
      curr_x += x[dir]
      curr_y += y[dir]
      k += 1
    end

    count += 1 if k == len_word
  end

  count
end

def count_word_found(grid, word)
  rows = grid.length
  cols = grid[0].length

  count = 0

  (0...rows).each do |i|
    (0...cols).each do |j|
      count += num_words_at_coord?(grid, i, j, word)
    end
  end

  count
end

def count_x_mas(grid)
  rows = grid.length
  cols = grid[0].length
  count = 0

  (1...rows - 1).each do |i|
    (1...cols - 1).each do |j|
      count += 1 if forms_cross?(grid, i, j)
    end
  end
  count
end

def forms_cross?(grid, i, j)
  return false unless grid[i][j] == "A"

  top_left = grid[i - 1][j - 1]
  top_right = grid[i - 1][j + 1]
  bottom_left = grid[i + 1][j - 1]
  bottom_right = grid[i + 1][j + 1]

  (top_left == "M" && bottom_right == "S" || top_left == "S" && bottom_right == "M") &&
    (top_right == "M" && bottom_left == "S" || top_right == "S" && bottom_left == "M")
end

grid = ARGF.readlines(chomp: true)
word = "XMAS"


puts "Puzzle 1: #{count_word_found(grid, word)}"
puts "Puzzle 2: #{count_x_mas(grid)}"
