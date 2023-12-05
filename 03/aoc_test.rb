require "minitest/autorun"
require "minitest/pride"
require "open3"

class AocTest < Minitest::Test

  INPUT = <<~EOI
    467..114..
    ...*......
    ..35..633.
    ......#...
    617*......
    .....+.58.
    ..592.....
    ......755.
    ...$.*....
    .664.598..
  EOI

  def execute(input)
    output, _status = Open3.capture2e("./aoc.rb", stdin_data: input)
    puts output
    output
  end

  def test_correctly_sums_part_numbers
    assert_match "Part numbers sum: 4361", execute(INPUT)
  end

  def test_correctly_sums_gear_ratios
    assert_match "Gear ratio sum: 467835", execute(INPUT)
  end
end
