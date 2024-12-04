require "minitest/autorun"
require "minitest/pride"
require "open3"

class AocTest < Minitest::Test
  INPUT = <<~EOI
    xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))
  EOI

  def execute(input)
    output, _status = Open3.capture2e("ruby aoc.rb", stdin_data: input)
    output
  end

  def test_puzzle_one
    assert_match "Puzzle 1: 161", execute(INPUT)
  end

  def test_puzzle_two
    assert_match "Puzzle 2: 48", execute(INPUT)
  end
end
