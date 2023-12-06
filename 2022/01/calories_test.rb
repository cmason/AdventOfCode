require "minitest/autorun"
require "minitest/pride"
require "open3"
# require_relative "calories"

class CaloriesTest < Minitest::Test
  INPUT = <<~EOF
    1000
    2000
    3000

    4000

    5000
    6000

    7000
    8000
    9000

    10000
  EOF

  def test_returns_the_most_calories_and_sum_of_top_3
    output, _status = Open3.capture2e("./calories.rb", stdin_data: INPUT)
    assert_equal "24000\n45000\n", output
  end
end
