require "minitest/autorun"
require "minitest/pride"
require "open3"

class CalibrationTest < Minitest::Test

  def calibrate(input)
    output, _status = Open3.capture2e("./aoc.rb", stdin_data: input)
    output
  end

  def test_sums_calibration_values
    assert_equal "142\n", calibrate(<<~EOS
      1abc2
      pqr3stu8vwx
      a1b2c3d4e5f
      treb7uchet
    EOS
    )
    
  end

  def test_sums_calibration_values_with_digits_as_words
    assert_equal "281\n", calibrate(<<~EOS
      two1nine
      eightwothree
      abcone2threexyz
      xtwone3four
      4nineeightseven2
      zoneight234
      7pqrstsixteen
    EOS
    )
  end
end
