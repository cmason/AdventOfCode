class SonarSweep
  def self.report(measurements)
    measurements.each_cons(2).count { |a,b| b > a }
  end
  
  def self.sliding_report(measurements)
    window_sum = measurements.each_cons(3).map(&:sum)
    self.report(window_sum)
  end
end