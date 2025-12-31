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
    assert_match(/Puzzle 1: 4277556/, execute(INPUT))
  end

  def test_puzzle_two
    assert_match(/Puzzle 2: 3263827/, execute(INPUT))
    puts execute(INPUT)
  end
end

__END__
123 328  51 64  
 45 64  387 23  
  6 98  215 314 
*   +   *   +   
