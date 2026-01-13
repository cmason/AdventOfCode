#!/usr/bin/env ruby

input = ARGF.read.lines.map(&:chomp)

def parse_shapes_and_regions(lines)
  shapes = []
  regions = []
  mode = :shapes
  current = nil

  lines.each do |line|
    stripped = line.chomp
    next if stripped.empty?
    if mode == :shapes && stripped.match?(/\d+x\d+:/)
      mode = :regions
    end

    if mode == :regions
      regions << stripped
      next
    end

    if stripped.match?(/\A\d+:/)
      current = []
      shapes << current
      next
    end

    current << stripped if current
  end

  [shapes, regions]
end

def region_fits_by_area?(region_line, shape_areas)
  dims, counts_text = region_line.split(":")
  width, height = dims.split("x").map(&:to_i)
  counts = counts_text.strip.split.map(&:to_i)
  required = counts.each_with_index.sum do |count, idx|
    count * shape_areas[idx]
  end
  width * height >= required
end

def puzzle1(lines)
  shapes, regions = parse_shapes_and_regions(lines)
  shape_areas = shapes.map { |shape| shape.sum { |row| row.count("#") } }
  regions.count { |region| region_fits_by_area?(region, shape_areas) }
end

puts "Puzzle 1: #{puzzle1(input)}"
