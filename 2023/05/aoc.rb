#!/usr/bin/env ruby

seeds, *maps = ARGF.read.split("\n\n")
seeds = seeds.split[1..].map(&:to_i)
maps = maps.map { _1.split.map(&:to_i)[2..] }

def transform_seeds(seeds, maps)
  seeds.map do |seed|
    maps.reduce(seed) do |s, mapping|
      slice = mapping.each_slice(3).find { |(_, a, l)| s >= a && s < a + l }
      slice ? s - slice[1] + slice[0] : s
    end
  end
end

conv = transform_seeds(seeds, maps)

puts "Puzzle 1: #{conv.min}"

# Brute force
seeds2 = seeds.each_slice(2).flat_map { (_1..).take(_2) }
conv2 = transform_seeds(seeds2, maps)

puts "Puzzle 2: #{conv2.min}"
