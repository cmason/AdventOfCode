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
    assert_match "Puzzle 1: 4", execute(INPUT)
  end

  def test_puzzle_two
    assert_match "Puzzle 2: 24", execute(INPUT)
  end
end

# __END__
# L68
# L30
# R48
# L5
# R60
# L55
# L1
# L99
# R14
# L82
__END__
R1000
L1000
L50
R1
L1
L1
R1
R100
R1
