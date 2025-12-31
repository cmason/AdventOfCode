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
    assert_match(/Puzzle 1: 40/, execute(INPUT))
  end

  def test_puzzle_two
    assert_match(/Puzzle 2: 25272/, execute(INPUT))
  end
end

__END__
162,817,812
57,618,57
906,360,560
592,479,940
352,342,300
466,668,158
542,29,236
431,825,988
739,650,466
52,470,668
216,146,977
819,987,18
117,168,530
805,96,715
346,949,466
970,615,88
941,993,340
862,61,35
984,92,344
425,690,689
