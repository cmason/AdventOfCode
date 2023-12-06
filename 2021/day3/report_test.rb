require "minitest/autorun"
require_relative "report"

class ReportTest < Minitest::Test
  DIAGNOSTICS = %w[
    00100
    11110
    10110
    10111
    10101
    01111
    00111
    11100
    10000
    11001
    00010
    01010
  ]

  def setup
    @report = Report.new(DIAGNOSTICS)
  end

  def test_gamma_rate
    assert_equal 0b10110, @report.gamma_rate
  end

  def test_epsilon_rate
    assert_equal 0b01001, @report.epsilon_rate
  end

  def test_power_consumption
    assert_equal 198, @report.power_consumption
  end
  
  def test_oxygen_generator_rating
    assert_equal 23, @report.oxygen_generator_rating
  end
  
  def test_co2_scrubber_rating
    assert_equal 10, @report.co2_scrubber_rating
  end
  
  def test_life_support_rating
    assert_equal 230, @report.life_support_rating
  end
end
