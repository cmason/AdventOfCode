class Submarine
  attr_reader :horizontal, :depth, :aim
  
  def initialize
    @horizontal = 0
    @depth = 0
    @aim = 0
  end
  
  def forward(units)
    @depth += @aim * units
    @horizontal += units
  end
  
  def down(units)
    @aim += units
  end
  
  def up(units)
    @aim -= units
  end
  
  def position
    @horizontal * @depth
  end
end