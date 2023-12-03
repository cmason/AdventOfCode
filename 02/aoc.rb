#!/usr/bin/env ruby

CUBES = {
    r: 12,
    g: 13,
    b: 14
}

def possible?(cube)
    num, color = cube.split(" ")
    CUBES[color.to_sym] >= num.to_i
end

def power(sets)
    min_set = Hash.new(0)
    sets.each do |set|
      num, color = set.split(" ")
      num = num.to_i
      min_set[color] = num if num > min_set[color]
    end
    min_set.values.inject(&:*)
end 
# Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
games = $stdin.each_line.map do |line|
    sets = line.scan(/\d+ [rbg]/)
    {
        possible: sets.all? { |cube| possible?(cube) },
        power:  power(sets)
    }   
end 

id_sum = games.each_with_index.sum { |game, index| game[:possible] ? index + 1 : 0 } 
power_sum = games.sum { |game| game[:power] }
puts "sum of possible game ids: #{id_sum}"
puts "sum of the power of sets: #{power_sum}"