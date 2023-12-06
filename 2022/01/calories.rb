#!/usr/bin/env ruby

cals_per_elf = $stdin.read.split("\n\n").map { |e| e.split("\n").map(&:to_i) }.map(&:sum)
puts cals_per_elf.max
puts cals_per_elf.sort[-3..].sum
