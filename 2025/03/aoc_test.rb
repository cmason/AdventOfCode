require "minitest/autorun"
require "minitest/pride"
require "open3"

class AocTest < Minitest::Test
  INPUT = DATA.read

  def execute(input)
    output, _status = Open3.capture2e("./aoc.rb", stdin_data: input)
    puts output
    output
  end

  def test_puzzle_one
    assert_match "Puzzle 1: 357", execute(INPUT)
  end

  def test_puzzle_two
    assert_match "Puzzle 2: 3121910778619", execute(INPUT)
  end
end

__END__
987654321111111
811111111111119
234234234234278
818181911112111
