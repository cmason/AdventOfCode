require "minitest/autorun"
require "minitest/pride"
require "open3"

class RucksackTest < Minitest::Test
  INPUT = <<~EOF
      [D]
  [N] [C]
  [Z] [M] [P]
   1   2   3

  move 1 from 2 to 1
  move 3 from 1 to 3
  move 2 from 2 to 1
  move 1 from 1 to 2
  EOF

  def test_finds_crates_on_each_stack
    output, _status = Open3.capture2e("./stacks.rb", stdin_data: INPUT)
    assert_equal "CMZ\n", output
  end

  def test_finds_crates_on_each_stack_with_mover_9001
    output, _status = Open3.capture2e("./stacks2.rb", stdin_data: INPUT)
    assert_equal "MCD\n", output
  end
end
