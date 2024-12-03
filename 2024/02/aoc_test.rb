require "minitest/autorun"
require "minitest/pride"
require "open3"

class AocTest < Minitest::Test
  INPUT = <<~EOI
    7 6 4 2 1
    1 2 7 8 9
    9 7 6 2 1
    1 3 2 4 5
    8 6 4 4 1
    1 3 6 7 9
  EOI

  def execute(input)
    output, _status = Open3.capture2e("ruby aoc.rb", stdin_data: input)
    output
  end

  def test_puzzle_one
    assert_match "Safe: 2", execute(INPUT)
  end

  def test_puzzle_two
    assert_match "Safe with dampening: 4", execute(INPUT)
  end
end
