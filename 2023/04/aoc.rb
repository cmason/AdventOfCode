#!/usr/bin/env ruby

CARD_REGEX = /\ACard\W+(?<card>\d+): (?<winning>.*)\| (?<numbers>.*)\Z/
card_count = points = 0
cards = Array.new(220, 0)
$stdin.each_line do |line|
  match = line.match(CARD_REGEX)

  card = match[:card].to_i
  winning = match[:winning].strip.split(" ").map(&:to_i)
  numbers = match[:numbers].strip.split(" ").map(&:to_i)

  matches = (winning & numbers).size
  points += (matches > 2) ? 2**(matches - 1) : matches
  count = (cards[card] += 1)
  card_count += count
  matches.times { |i| cards[card + i + 1] += count }
end

puts "Points: #{points}", "Cards: #{card_count}"
