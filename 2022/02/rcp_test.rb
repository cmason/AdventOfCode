require "minitest/autorun"
require "minitest/pride"
require "open3"

class RCPTest < Minitest::Test
  INPUT = <<~EOF
    A Y
    B X
    C Z
  EOF

  def test_part_1_returns_the_correct_score
    output, _status = Open3.capture2e("./rcp1.rb", stdin_data: INPUT)
    assert_equal "15\n", output
  end

  def test_part_2_returns_the_correct_score
    output, _status = Open3.capture2e("./rcp2.rb", stdin_data: INPUT)
    assert_equal "12\n", output
  end
end
