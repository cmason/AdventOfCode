require "minitest/autorun"
require "minitest/pride"
require "open3"

class AocTest < Minitest::Test
  INPUT = DATA.read

  def execute(input)
    output, _ = Open3.capture2e("./aoc.rb", stdin_data: input)
    output
  end

  def test_puzzle_one
    assert_match(/Puzzle 1: \d+/, execute(INPUT))
  end

  def test_puzzle_two
    assert_match(/Puzzle 2: \d+/, execute(INPUT))
  end
end

__END__
# Paste sample input here for testing
