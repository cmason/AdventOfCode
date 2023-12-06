#!/usr/bin/env ruby

LOSE = "X"
DRAW = "Y"
WIN = "Z"
OPPONENT_MOVES = %w[A B C]

scores = $stdin.each_line.map do |round|
  opp, outcome = round.split
  opp = OPPONENT_MOVES.index(opp)

  case outcome
  when LOSE
    1 + (opp - 1) % 3
  when DRAW
    1 + opp + 3
  when WIN
    1 + (opp + 1) % 3 + 6
  end
end

puts scores.sum
