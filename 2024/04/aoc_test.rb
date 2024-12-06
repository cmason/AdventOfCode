require "minitest/autorun"
require "minitest/pride"
require "open3"

class AocTest < Minitest::Test
  INPUT = <<~EOI
    MMMSXXMASM
    MSAMXMSMSA
    AMXSXMAAMM
    MSAMASMSMX
    XMASAMXAMM
    XXAMMXXAMA
    SMSMSASXSS
    SAXAMASAAA
    MAMMMXMMMM
    MXMXAXMASX
  EOI

  def execute(input)
    output, _status = Open3.capture2e("ruby aoc.rb", stdin_data: input)
    output
  end

  def test_puzzle_one
    assert_match "Puzzle 1: 18", execute(INPUT)
  end

  def test_puzzle_two
    assert_match "Puzzle 2: 9", execute(INPUT)
  end
end
