require 'minitest/autorun'
require_relative 'submarine'

# Common test data version: 1.0.0 ca9ed58
class SubmarineTest < Minitest::Test
  
  def test_sample_position
    submarine = Submarine.new
    submarine.forward 5
    submarine.down 5
    submarine.forward 8
    submarine.up 3
    submarine.down 8
    submarine.forward 2
    assert_equal 900, submarine.position
  end
  
  def test_input
    submarine = Submarine.new
    submarine.forward 9
    submarine.down 9
    submarine.up 4
    submarine.down 5
    submarine.down 6
    submarine.up 6
    submarine.down 7
    submarine.down 1
    submarine.forward 6
    submarine.down 4
    submarine.forward 8
    submarine.up 5
    submarine.forward 9
    submarine.down 1
    submarine.down 4
    submarine.up 4
    submarine.up 5
    submarine.up 4
    submarine.down 1
    submarine.forward 8
    submarine.down 1
    submarine.forward 2
    submarine.forward 8
    submarine.down 9
    submarine.forward 2
    submarine.down 6
    submarine.down 2
    submarine.up 8
    submarine.down 6
    submarine.forward 9
    submarine.forward 7
    submarine.down 6
    submarine.forward 3
    submarine.down 2
    submarine.forward 4
    submarine.down 5
    submarine.up 2
    submarine.down 9
    submarine.down 8
    submarine.up 5
    submarine.forward 5
    submarine.forward 4
    submarine.up 9
    submarine.forward 9
    submarine.down 8
    submarine.forward 8
    submarine.forward 2
    submarine.up 8
    submarine.down 7
    submarine.forward 8
    submarine.down 3
    submarine.forward 6
    submarine.up 9
    submarine.forward 9
    submarine.forward 4
    submarine.forward 9
    submarine.forward 6
    submarine.down 4
    submarine.up 2
    submarine.forward 4
    submarine.up 5
    submarine.up 6
    submarine.forward 9
    submarine.down 3
    submarine.forward 4
    submarine.forward 9
    submarine.down 1
    submarine.forward 1
    submarine.up 6
    submarine.up 4
    submarine.forward 7
    submarine.up 7
    submarine.up 3
    submarine.forward 2
    submarine.forward 8
    submarine.forward 6
    submarine.down 4
    submarine.forward 2
    submarine.forward 3
    submarine.down 7
    submarine.down 5
    submarine.down 8
    submarine.down 5
    submarine.forward 1
    submarine.down 8
    submarine.down 2
    submarine.down 8
    submarine.down 3
    submarine.forward 4
    submarine.forward 8
    submarine.forward 9
    submarine.down 1
    submarine.forward 8
    submarine.down 1
    submarine.down 6
    submarine.down 7
    submarine.down 7
    submarine.forward 5
    submarine.forward 3
    submarine.down 2
    submarine.down 1
    submarine.forward 2
    submarine.forward 1
    submarine.down 6
    submarine.down 4
    submarine.up 5
    submarine.up 9
    submarine.down 4
    submarine.forward 9
    submarine.down 2
    submarine.down 5
    submarine.down 4
    submarine.down 2
    submarine.forward 2
    submarine.forward 4
    submarine.forward 6
    submarine.forward 6
    submarine.forward 3
    submarine.down 6
    submarine.up 5
    submarine.forward 8
    submarine.forward 3
    submarine.down 9
    submarine.down 3
    submarine.forward 4
    submarine.forward 2
    submarine.down 9
    submarine.down 8
    submarine.down 7
    submarine.down 3
    submarine.forward 2
    submarine.down 7
    submarine.down 3
    submarine.down 5
    submarine.forward 6
    submarine.up 9
    submarine.up 8
    submarine.forward 5
    submarine.down 6
    submarine.down 1
    submarine.down 6
    submarine.down 5
    submarine.forward 7
    submarine.down 2
    submarine.forward 8
    submarine.forward 7
    submarine.forward 2
    submarine.forward 8
    submarine.up 6
    submarine.forward 5
    submarine.down 2
    submarine.down 5
    submarine.up 8
    submarine.up 6
    submarine.forward 1
    submarine.down 4
    submarine.up 5
    submarine.up 5
    submarine.up 5
    submarine.forward 4
    submarine.up 1
    submarine.forward 3
    submarine.down 9
    submarine.down 6
    submarine.up 1
    submarine.forward 1
    submarine.forward 2
    submarine.forward 1
    submarine.forward 4
    submarine.forward 6
    submarine.forward 6
    submarine.up 7
    submarine.down 7
    submarine.down 7
    submarine.down 9
    submarine.forward 9
    submarine.down 1
    submarine.down 5
    submarine.down 1
    submarine.down 7
    submarine.down 1
    submarine.up 6
    submarine.forward 2
    submarine.down 4
    submarine.up 3
    submarine.up 2
    submarine.forward 6
    submarine.up 4
    submarine.down 1
    submarine.down 5
    submarine.forward 9
    submarine.up 4
    submarine.up 3
    submarine.forward 3
    submarine.up 7
    submarine.forward 2
    submarine.forward 5
    submarine.down 9
    submarine.forward 7
    submarine.forward 4
    submarine.down 1
    submarine.up 2
    submarine.forward 4
    submarine.up 4
    submarine.down 2
    submarine.forward 4
    submarine.up 5
    submarine.up 1
    submarine.down 9
    submarine.down 3
    submarine.up 6
    submarine.forward 7
    submarine.up 7
    submarine.forward 2
    submarine.down 4
    submarine.up 3
    submarine.up 3
    submarine.forward 4
    submarine.up 5
    submarine.down 3
    submarine.up 8
    submarine.forward 6
    submarine.forward 8
    submarine.down 1
    submarine.down 9
    submarine.down 7
    submarine.forward 7
    submarine.forward 5
    submarine.forward 2
    submarine.up 9
    submarine.forward 3
    submarine.forward 1
    submarine.down 7
    submarine.down 6
    submarine.forward 5
    submarine.up 3
    submarine.forward 6
    submarine.down 4
    submarine.forward 9
    submarine.down 7
    submarine.forward 9
    submarine.down 9
    submarine.down 5
    submarine.down 6
    submarine.down 2
    submarine.down 2
    submarine.down 8
    submarine.down 3
    submarine.down 9
    submarine.forward 5
    submarine.up 6
    submarine.forward 1
    submarine.down 3
    submarine.down 2
    submarine.up 1
    submarine.up 6
    submarine.forward 3
    submarine.down 6
    submarine.down 6
    submarine.up 9
    submarine.up 8
    submarine.forward 2
    submarine.down 7
    submarine.forward 5
    submarine.up 9
    submarine.down 7
    submarine.down 3
    submarine.forward 2
    submarine.forward 2
    submarine.up 9
    submarine.forward 1
    submarine.forward 7
    submarine.down 9
    submarine.forward 6
    submarine.forward 7
    submarine.up 8
    submarine.down 7
    submarine.down 5
    submarine.down 3
    submarine.up 6
    submarine.down 5
    submarine.forward 6
    submarine.down 9
    submarine.down 6
    submarine.up 9
    submarine.down 7
    submarine.forward 2
    submarine.down 5
    submarine.up 4
    submarine.down 4
    submarine.down 8
    submarine.forward 7
    submarine.down 9
    submarine.forward 8
    submarine.forward 6
    submarine.down 7
    submarine.down 1
    submarine.forward 5
    submarine.up 6
    submarine.forward 4
    submarine.up 7
    submarine.up 4
    submarine.up 5
    submarine.forward 9
    submarine.forward 5
    submarine.forward 4
    submarine.down 6
    submarine.down 5
    submarine.forward 2
    submarine.forward 7
    submarine.down 8
    submarine.forward 3
    submarine.up 5
    submarine.down 2
    submarine.up 3
    submarine.forward 4
    submarine.up 5
    submarine.up 2
    submarine.forward 4
    submarine.forward 1
    submarine.forward 1
    submarine.forward 4
    submarine.forward 4
    submarine.down 2
    submarine.forward 1
    submarine.forward 1
    submarine.up 5
    submarine.up 7
    submarine.down 8
    submarine.down 4
    submarine.forward 2
    submarine.forward 2
    submarine.down 3
    submarine.forward 7
    submarine.down 8
    submarine.up 3
    submarine.forward 2
    submarine.down 2
    submarine.forward 3
    submarine.up 2
    submarine.forward 3
    submarine.up 6
    submarine.down 7
    submarine.up 7
    submarine.down 3
    submarine.up 9
    submarine.forward 3
    submarine.forward 7
    submarine.down 7
    submarine.up 9
    submarine.down 6
    submarine.down 2
    submarine.forward 8
    submarine.forward 8
    submarine.up 7
    submarine.down 6
    submarine.forward 2
    submarine.forward 1
    submarine.down 4
    submarine.up 2
    submarine.forward 6
    submarine.up 7
    submarine.down 5
    submarine.up 1
    submarine.forward 3
    submarine.forward 9
    submarine.up 4
    submarine.forward 5
    submarine.forward 8
    submarine.down 3
    submarine.up 5
    submarine.forward 9
    submarine.down 6
    submarine.up 9
    submarine.forward 5
    submarine.down 4
    submarine.down 1
    submarine.down 6
    submarine.up 9
    submarine.up 2
    submarine.forward 5
    submarine.down 1
    submarine.up 3
    submarine.down 5
    submarine.forward 2
    submarine.down 4
    submarine.forward 5
    submarine.down 6
    submarine.down 4
    submarine.down 4
    submarine.forward 1
    submarine.down 7
    submarine.down 2
    submarine.forward 4
    submarine.forward 5
    submarine.up 9
    submarine.down 6
    submarine.down 2
    submarine.forward 7
    submarine.up 8
    submarine.down 9
    submarine.forward 7
    submarine.down 5
    submarine.down 2
    submarine.down 8
    submarine.down 8
    submarine.up 4
    submarine.up 3
    submarine.down 3
    submarine.down 7
    submarine.forward 4
    submarine.forward 6
    submarine.down 4
    submarine.up 7
    submarine.forward 4
    submarine.forward 4
    submarine.forward 1
    submarine.down 3
    submarine.down 2
    submarine.forward 7
    submarine.forward 2
    submarine.up 9
    submarine.down 7
    submarine.up 7
    submarine.forward 2
    submarine.forward 6
    submarine.forward 9
    submarine.down 3
    submarine.forward 7
    submarine.forward 5
    submarine.up 5
    submarine.up 1
    submarine.forward 6
    submarine.forward 4
    submarine.down 2
    submarine.forward 3
    submarine.forward 9
    submarine.down 1
    submarine.forward 6
    submarine.forward 7
    submarine.forward 1
    submarine.up 7
    submarine.up 4
    submarine.forward 7
    submarine.forward 8
    submarine.down 7
    submarine.down 8
    submarine.down 9
    submarine.forward 7
    submarine.down 9
    submarine.up 6
    submarine.down 7
    submarine.up 3
    submarine.down 7
    submarine.forward 4
    submarine.forward 9
    submarine.forward 1
    submarine.down 4
    submarine.forward 1
    submarine.up 4
    submarine.up 4
    submarine.forward 9
    submarine.forward 8
    submarine.up 4
    submarine.down 2
    submarine.forward 4
    submarine.forward 2
    submarine.forward 8
    submarine.down 2
    submarine.up 6
    submarine.down 4
    submarine.forward 6
    submarine.forward 5
    submarine.down 2
    submarine.forward 9
    submarine.down 5
    submarine.forward 5
    submarine.down 3
    submarine.down 2
    submarine.up 9
    submarine.down 3
    submarine.forward 6
    submarine.forward 6
    submarine.up 9
    submarine.down 1
    submarine.forward 4
    submarine.up 3
    submarine.forward 1
    submarine.forward 3
    submarine.forward 3
    submarine.down 6
    submarine.down 2
    submarine.forward 8
    submarine.down 4
    submarine.forward 8
    submarine.forward 8
    submarine.forward 5
    submarine.up 6
    submarine.forward 3
    submarine.down 1
    submarine.down 8
    submarine.forward 3
    submarine.forward 4
    submarine.down 2
    submarine.down 7
    submarine.up 8
    submarine.forward 3
    submarine.forward 8
    submarine.up 2
    submarine.forward 6
    submarine.down 4
    submarine.forward 9
    submarine.forward 5
    submarine.down 1
    submarine.forward 6
    submarine.forward 2
    submarine.down 3
    submarine.up 4
    submarine.down 7
    submarine.down 2
    submarine.up 2
    submarine.forward 7
    submarine.down 6
    submarine.down 2
    submarine.up 5
    submarine.up 5
    submarine.down 9
    submarine.down 7
    submarine.down 3
    submarine.down 1
    submarine.down 9
    submarine.forward 4
    submarine.down 4
    submarine.forward 7
    submarine.forward 8
    submarine.forward 4
    submarine.up 6
    submarine.forward 6
    submarine.forward 9
    submarine.down 2
    submarine.forward 4
    submarine.down 8
    submarine.down 4
    submarine.forward 5
    submarine.forward 2
    submarine.up 4
    submarine.down 3
    submarine.up 8
    submarine.up 1
    submarine.down 1
    submarine.forward 9
    submarine.up 3
    submarine.up 1
    submarine.forward 1
    submarine.forward 7
    submarine.forward 1
    submarine.down 7
    submarine.forward 7
    submarine.forward 7
    submarine.down 7
    submarine.forward 4
    submarine.up 6
    submarine.forward 3
    submarine.down 1
    submarine.up 1
    submarine.up 8
    submarine.forward 5
    submarine.forward 2
    submarine.up 4
    submarine.forward 7
    submarine.down 2
    submarine.down 3
    submarine.down 8
    submarine.up 7
    submarine.up 5
    submarine.forward 8
    submarine.down 5
    submarine.down 3
    submarine.down 9
    submarine.forward 6
    submarine.forward 4
    submarine.down 9
    submarine.up 5
    submarine.forward 3
    submarine.up 7
    submarine.up 9
    submarine.up 1
    submarine.forward 1
    submarine.forward 3
    submarine.forward 1
    submarine.up 8
    submarine.up 4
    submarine.down 1
    submarine.down 8
    submarine.down 3
    submarine.down 1
    submarine.down 1
    submarine.down 9
    submarine.forward 4
    submarine.down 3
    submarine.forward 9
    submarine.forward 2
    submarine.down 1
    submarine.forward 9
    submarine.up 7
    submarine.forward 6
    submarine.up 4
    submarine.forward 8
    submarine.forward 3
    submarine.down 2
    submarine.down 2
    submarine.down 2
    submarine.up 5
    submarine.forward 1
    submarine.up 1
    submarine.forward 7
    submarine.down 1
    submarine.forward 1
    submarine.down 8
    submarine.up 4
    submarine.up 1
    submarine.forward 7
    submarine.down 8
    submarine.down 9
    submarine.forward 2
    submarine.forward 1
    submarine.up 3
    submarine.forward 4
    submarine.up 8
    submarine.forward 5
    submarine.down 2
    submarine.forward 6
    submarine.forward 8
    submarine.up 9
    submarine.forward 2
    submarine.down 7
    submarine.down 4
    submarine.up 3
    submarine.forward 1
    submarine.forward 6
    submarine.forward 9
    submarine.down 1
    submarine.down 8
    submarine.down 1
    submarine.down 2
    submarine.forward 3
    submarine.forward 9
    submarine.forward 2
    submarine.forward 4
    submarine.forward 7
    submarine.forward 3
    submarine.up 8
    submarine.up 9
    submarine.forward 3
    submarine.forward 6
    submarine.down 5
    submarine.up 6
    submarine.down 8
    submarine.forward 5
    submarine.up 4
    submarine.up 9
    submarine.forward 6
    submarine.forward 3
    submarine.up 9
    submarine.forward 8
    submarine.forward 5
    submarine.forward 9
    submarine.forward 7
    submarine.up 6
    submarine.forward 3
    submarine.forward 1
    submarine.up 4
    submarine.forward 9
    submarine.forward 8
    submarine.up 1
    submarine.up 2
    submarine.down 3
    submarine.down 4
    submarine.down 9
    submarine.down 4
    submarine.down 5
    submarine.down 6
    submarine.down 2
    submarine.down 5
    submarine.forward 6
    submarine.forward 4
    submarine.up 2
    submarine.up 7
    submarine.down 5
    submarine.down 9
    submarine.forward 3
    submarine.down 5
    submarine.forward 6
    submarine.down 7
    submarine.forward 1
    submarine.forward 7
    submarine.forward 9
    submarine.forward 7
    submarine.forward 4
    submarine.forward 4
    submarine.up 1
    submarine.up 4
    submarine.down 6
    submarine.up 2
    submarine.up 1
    submarine.down 4
    submarine.forward 2
    submarine.down 4
    submarine.forward 6
    submarine.down 3
    submarine.up 6
    submarine.down 2
    submarine.up 3
    submarine.forward 1
    submarine.forward 9
    submarine.forward 3
    submarine.up 9
    submarine.forward 7
    submarine.forward 5
    submarine.forward 4
    submarine.down 5
    submarine.down 9
    submarine.forward 6
    submarine.forward 7
    submarine.up 1
    submarine.forward 7
    submarine.forward 2
    submarine.forward 2
    submarine.forward 5
    submarine.forward 6
    submarine.down 3
    submarine.down 7
    submarine.down 3
    submarine.down 4
    submarine.down 6
    submarine.down 1
    submarine.forward 2
    submarine.down 8
    submarine.forward 4
    submarine.forward 7
    submarine.up 1
    submarine.down 4
    submarine.down 1
    submarine.down 2
    submarine.down 3
    submarine.up 3
    submarine.forward 9
    submarine.forward 2
    submarine.down 8
    submarine.up 3
    submarine.forward 8
    submarine.forward 7
    submarine.up 8
    submarine.down 8
    submarine.forward 2
    submarine.down 9
    submarine.down 9
    submarine.down 5
    submarine.forward 1
    submarine.forward 3
    submarine.forward 6
    submarine.up 1
    submarine.up 2
    submarine.forward 1
    submarine.down 3
    submarine.up 6
    submarine.forward 2
    submarine.forward 8
    submarine.forward 2
    submarine.down 3
    submarine.forward 8
    submarine.forward 9
    submarine.down 7
    submarine.down 3
    submarine.down 2
    submarine.down 9
    submarine.down 3
    submarine.up 6
    submarine.forward 9
    submarine.forward 5
    submarine.forward 1
    submarine.forward 9
    submarine.down 9
    submarine.up 2
    submarine.down 1
    submarine.up 6
    submarine.forward 6
    submarine.down 3
    submarine.forward 6
    submarine.forward 3
    submarine.forward 5
    submarine.forward 4
    submarine.up 2
    submarine.up 4
    submarine.up 6
    submarine.forward 1
    submarine.forward 6
    submarine.up 6
    submarine.up 4
    submarine.up 7
    submarine.down 8
    submarine.down 5
    submarine.up 1
    submarine.up 1
    submarine.down 5
    submarine.forward 5
    submarine.down 9
    submarine.forward 8
    submarine.down 3
    submarine.up 4
    submarine.down 9
    submarine.down 1
    submarine.forward 2
    submarine.forward 9
    submarine.down 3
    submarine.down 8
    submarine.down 5
    submarine.down 6
    submarine.forward 7
    submarine.forward 1
    submarine.down 9
    submarine.down 7
    submarine.forward 8
    submarine.forward 2
    submarine.up 1
    submarine.up 1
    submarine.forward 7
    submarine.up 1
    submarine.forward 2
    submarine.down 9
    submarine.up 4
    submarine.forward 5
    submarine.down 1
    submarine.up 1
    submarine.down 8
    submarine.down 3
    submarine.up 1
    submarine.down 8
    submarine.down 7
    submarine.down 2
    submarine.forward 9
    submarine.down 5
    submarine.forward 2
    submarine.up 2
    submarine.up 6
    submarine.up 4
    submarine.forward 6
    submarine.up 5
    submarine.forward 5
    submarine.forward 4
    submarine.forward 8
    submarine.down 8
    submarine.down 6
    submarine.down 1
    submarine.down 3
    submarine.down 6
    submarine.forward 8
    submarine.up 1
    submarine.up 5
    submarine.down 4
    submarine.forward 4
    submarine.down 9
    submarine.forward 4
    submarine.up 6
    submarine.down 7
    submarine.forward 4
    submarine.down 3
    submarine.down 4
    submarine.forward 1
    submarine.forward 3
    submarine.down 1
    submarine.down 7
    submarine.up 8
    submarine.down 3
    submarine.down 4
    submarine.down 3
    submarine.forward 3
    submarine.down 8
    submarine.forward 8
    submarine.down 3
    submarine.down 7
    submarine.forward 2
    submarine.up 2
    submarine.forward 7
    submarine.down 9
    submarine.up 7
    submarine.forward 5
    submarine.down 2
    submarine.down 5
    submarine.up 4
    submarine.up 8
    submarine.forward 8
    submarine.forward 9
    submarine.forward 8
    submarine.down 8
    submarine.forward 6
    submarine.forward 9
    submarine.forward 6
    submarine.forward 8
    submarine.forward 6
    submarine.forward 8
    submarine.forward 2
    submarine.down 7
    submarine.down 3
    submarine.forward 7
    submarine.down 4
    submarine.down 5
    submarine.up 1
    submarine.forward 5
    submarine.down 3
    submarine.down 7
    submarine.up 4
    submarine.forward 9
    submarine.down 2
    submarine.down 3
    submarine.forward 1
    submarine.up 6
    submarine.down 1
    submarine.down 9
    submarine.forward 8
    submarine.forward 9
    submarine.forward 2
    submarine.down 6
    submarine.down 4
    submarine.up 3
    submarine.up 8
    submarine.forward 1
    submarine.down 3
    submarine.up 8
    submarine.up 7
    submarine.down 4
    submarine.up 3
    submarine.down 7
    submarine.down 2
    submarine.down 5
    submarine.down 7
    submarine.down 2
    submarine.forward 2
    submarine.down 3
    submarine.up 2
    submarine.forward 8
    submarine.up 1
    submarine.forward 2
    submarine.up 4
    submarine.forward 1
    submarine.forward 8
    submarine.forward 6
    submarine.forward 2
    submarine.down 2
    submarine.forward 5
    submarine.up 4
    submarine.down 9
    submarine.down 7
    submarine.forward 2
    submarine.down 9
    submarine.down 9
    submarine.forward 6
    submarine.down 8
    submarine.down 4
    submarine.down 7
    submarine.down 9
    submarine.forward 7
    submarine.forward 7
    submarine.up 6
    submarine.forward 3
    submarine.forward 5
    submarine.forward 6
    submarine.down 8
    submarine.up 1
    submarine.forward 2
    submarine.up 4
    submarine.up 2
    submarine.down 8
    submarine.down 9
    submarine.down 1
    submarine.down 3
    submarine.forward 7
    submarine.forward 5
    submarine.forward 6
    submarine.up 6
    submarine.down 7
    submarine.up 8
    submarine.up 1
    submarine.forward 8
    submarine.down 5
    submarine.up 1
    submarine.down 2
    submarine.down 5
    submarine.forward 6
    submarine.down 4
    submarine.forward 5
    submarine.down 4
    submarine.forward 3
    submarine.down 5
    submarine.up 4
    submarine.up 7
    submarine.forward 2
    submarine.up 2
    submarine.down 8
    submarine.forward 6
    
    assert_equal 1_340_836_560, submarine.position
  end
end
