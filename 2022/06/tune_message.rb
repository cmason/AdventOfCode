#!/usr/bin/env ruby

chars = $stdin.read.chars

puts chars.each_cons(14).find_index { |a| a.uniq.length == 14 } + 14
