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
    assert_match(/Puzzle 1: 5/, execute(INPUT))
  end

  def test_puzzle_two
    assert_match(/Puzzle 2: 2/, execute(puzzle2_data))
  end

  def puzzle2_data
    <<~DATA
      svr: aaa bbb
      aaa: fft
      fft: ccc
      bbb: tty
      tty: ccc
      ccc: ddd eee
      ddd: hub
      hub: fff
      eee: dac
      dac: fff
      fff: ggg hhh
      ggg: out
      hhh: out
    DATA
  end
end

__END__
aaa: you hhh
you: bbb ccc
bbb: ddd eee
ccc: ddd eee fff
ddd: ggg
eee: out
fff: out
ggg: out
hhh: ccc fff iii
iii: out
