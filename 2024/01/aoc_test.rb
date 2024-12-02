require "minitest/autorun"
require "minitest/pride"
require "open3"

class AocTest < Minitest::Test
  INPUT = <<~EOI
    3   4
    4   3
    2   5
    1   3
    3   9
    3   3
  EOI

  def execute(input)
    output, _status = Open3.capture2e("ruby aoc.rb", stdin_data: input)
    output
  end

  def test_puzzle_one
    assert_match "Total distance: 11", execute(INPUT)
  end

  def test_puzzle_two
    assert_match "Similarity score: 31", execute(INPUT)
  end
end
