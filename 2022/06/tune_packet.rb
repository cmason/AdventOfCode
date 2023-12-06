#!/usr/bin/env ruby

chars = $stdin.read.chars

puts chars.each_cons(4).find_index { |a| a.uniq.length == 4 } + 4
