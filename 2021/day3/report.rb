require "matrix"

class Report
  def initialize(data)
    @data = Matrix[*data.map { |string| string.split("") }]
    @gamma_rate = ""
    @epilon_rate = ""
    @tallies = []
    @data.column_vectors.each_with_index do |col, idx|
      tally = col.tally
      @tallies[idx] = tally
      if tally["0"] > tally["1"]
        @gamma_rate << "0"
        @epilon_rate << "1"
      else
        @gamma_rate << "1"
        @epilon_rate << "0"
      end
    end
  end

  def gamma_rate
    @gamma_rate.to_i(2)
  end

  def epsilon_rate
    @epilon_rate.to_i(2)
  end

  def power_consumption
    gamma_rate * epsilon_rate
  end
  
  def oxygen_generator_rating
    p @tallies
    0
  end
  
  def co2_scrubber_rating
    0
  end
  
  def life_support_rating
    oxygen_generator_rating * co2_scrubber_rating
  end
end
