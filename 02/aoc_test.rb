require "minitest/autorun"
require "minitest/pride"
require "open3"

class AocTest < Minitest::Test

  INPUT = <<~EOI
    Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
    Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
    Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
    Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
    Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
  EOI

  def execute(input)
    output, _status = Open3.capture2e("./aoc.rb", stdin_data: input)
    output
  end

  def test_correctly_sums_possible_game_ids
    assert_match "sum of possible game ids: 8", execute(INPUT)
  end

  def test_correctly_sums_power_of_minmum_sets
    assert_match "sum of the power of sets: 2286", execute(INPUT)
  end
end