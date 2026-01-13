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
    assert_match(/Puzzle 1: 50/, execute(INPUT))
  end

  def test_puzzle_two
    assert_match(/Puzzle 2: 24/, execute(INPUT))
  end
end

__END__
7,1
11,1
11,7
9,7
9,5
2,5
2,3
7,3
