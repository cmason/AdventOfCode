#!/usr/bin/env ruby

password = 0
alt_password = 0
pos = 50

$stdin.each_line do |line|
  if line =~ /([LR])(\d+)/
    dir, n = $1, $2.to_i
    if dir == "L"
      n.times do
        pos = (pos - 1) % 100
        alt_password += 1 if pos == 0
      end
    else
      n.times do
        pos = (pos + 1) % 100
        alt_password += 1 if pos == 0
      end
    end
    password += 1 if pos == 0
  end
end

puts "Puzzle 1: #{password}"
puts "Puzzle 2: #{alt_password}"
