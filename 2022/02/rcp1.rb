#!/usr/bin/env ruby

OPPONENT_MOVES = %w[A B C]
MY_MOVES = %w[X Y Z]

scores = $stdin.each_line.map do |round|
  opp, me = round.split
  opp = OPPONENT_MOVES.index(opp)
  me = MY_MOVES.index(me)

  score = 0
  score += 3 if opp == me
  score += 6 if (opp + 1) % 3 == me
  score + me + 1
end

puts scores.sum
