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
    assert_match "Puzzle 1: 1227775554", execute(INPUT)
  end

  def test_puzzle_two
    assert_match "Puzzle 2: 4174379265", execute(INPUT)
  end
end

__END__
11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124
