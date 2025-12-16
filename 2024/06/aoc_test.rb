require "minitest/autorun"
require "minitest/pride"
require "open3"

class AocTest < Minitest::Test
  INPUT = <<~EOI
    ....#.....
    .........#
    ..........
    ..#.......
    .......#..
    ..........
    .#..^.....
    ........#.
    #.........
    ......#...
  EOI

  def execute(input)
    output, _status = Open3.capture2e("ruby aoc.rb", stdin_data: input)
    puts output
    output
  end

  def test_puzzle_one
    assert_match "Puzzle 1: 41", execute(INPUT)
  end

  def test_puzzle_two
    skip
    assert_match "Puzzle 2: ???", execute(INPUT)
  end
end
