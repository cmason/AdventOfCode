require "minitest/autorun"
require "minitest/pride"
require "open3"

class TuneTest < Minitest::Test
  PACKETS = {
    bvwbjplbgvbhsrlpgdmjqwftvncz: 5,
    nppdvjthqldpwncqszvftbrmjlhg: 6,
    mjqjpqmgbljsphdztnvjfqwrcgsmlb: 7,
    nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg: 10,
    zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw: 11
  }

  def test_finds_the_first_packet_marker_position
    PACKETS.each_pair do |msg, pos|
      output, _status = Open3.capture2e("./tune_packet.rb", stdin_data: msg)
      assert_equal pos, output.to_i
    end
  end

  MESSAGES = {
    mjqjpqmgbljsphdztnvjfqwrcgsmlb: 19,
    bvwbjplbgvbhsrlpgdmjqwftvncz: 23,
    nppdvjthqldpwncqszvftbrmjlhg: 23,
    nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg: 29,
    zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw: 26
  }

  def test_finds_the_first_message_marker_position
    MESSAGES.each_pair do |msg, pos|
      output, _status = Open3.capture2e("./tune_message.rb", stdin_data: msg)
      assert_equal pos, output.to_i
    end
  end
end
