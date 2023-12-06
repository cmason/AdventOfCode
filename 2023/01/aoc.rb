#!/usr/bin/env ruby

WORDS = %w[one two three four five six seven eight nine]

def words2digits(string)
    WORDS.each_with_index { |word, i| string.gsub!(word,"#{word[0]}#{(i+1)}#{word[-1]}") }
    string
end
sum =  $stdin.each_line.sum do |line|
    digits = words2digits(line).scan(/\d/)
    "#{digits.first}#{digits.last}".to_i
end

puts sum