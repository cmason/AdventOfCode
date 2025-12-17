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
    assert_match(/Puzzle 1: 3/, execute(INPUT))
  end

  def test_puzzle_two
    assert_match(/Puzzle 2: 14/, execute(INPUT))
  end
end

__END__
3-5
10-14
16-20
12-18

1
5
8
11
17
32
