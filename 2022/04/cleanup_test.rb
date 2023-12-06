require "minitest/autorun"
require "minitest/pride"
require "open3"

class RucksackTest < Minitest::Test
  INPUT = <<~EOF
    2-4,6-8
    2-3,4-5
    5-7,7-9
    2-8,3-7
    6-6,4-6
    2-6,4-8
  EOF

  def test_counts_pairs_where_one_range_contains_another
    output, _status = Open3.capture2e("./cleanup.rb", stdin_data: INPUT)
    assert_equal "2\n", output
  end

  def test_counts_the_number_of_overlapped_pairs_correctly
    output, _status = Open3.capture2e("./cleanup2.rb", stdin_data: INPUT)
    assert_equal "4\n", output
  end
end
