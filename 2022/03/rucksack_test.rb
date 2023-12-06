require "minitest/autorun"
require "minitest/pride"
require "open3"

class RucksackTest < Minitest::Test
  INPUT = <<~EOF
    vJrwpWtwJgWrhcsFMMfFFhFp
    jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
    PmmdzqPrVvPwwTWBwg
    wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
    ttgJtRGJQctTZtZT
    CrZsJsPPZsGzwwsLwLmpwMDw
  EOF

  def test_sums_the_item_priorities_correctly
    output, _status = Open3.capture2e("./rucksack.rb", stdin_data: INPUT)
    assert_equal "157\n", output
  end

  def test_sums_the_badge_priorities_correctly
    output, _status = Open3.capture2e("./rucksack2.rb", stdin_data: INPUT)
    assert_equal "70\n", output
  end
end
