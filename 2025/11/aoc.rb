#!/usr/bin/env ruby

input = ARGF.read.lines.map(&:chomp)

def parse_graph(input)
  graph = {}
  input.each do |line|
    next if line.strip.empty?
    device, outputs = line.split(": ")
    graph[device] = outputs.split(" ")
  end
  graph
end

def count_paths(graph, current, target, visited)
  # Base case: reached target
  return 1 if current == target

  # Dead end: no outputs or already visited in this path
  return 0 if !graph[current] || visited.include?(current)

  # Mark current as visited for this path
  visited = visited.dup
  visited.add(current)

  # Explore all neighbors and sum the paths
  total = 0
  graph[current].each do |neighbor|
    total += count_paths(graph, neighbor, target, visited)
  end

  total
end

def puzzle1(input)
  graph = parse_graph(input)
  count_paths(graph, "you", "out", Set.new)
end

def puzzle2(input)
  graph = parse_graph(input)
  required = %w[dac fft]
  mask_map = required.each_with_index.to_h { |name, idx| [name, (1 << idx)] }
  target_mask = (1 << required.size) - 1
  cache = {}
  count_paths_mask(graph, "svr", "out", 0, mask_map, target_mask, cache)
end

def count_paths_mask(graph, current, target, mask, mask_map, target_mask, cache)
  return (mask == target_mask) ? 1 : 0 if current == target
  return 0 if !graph[current]

  key = [current, mask]
  return cache[key] if cache.key?(key)

  mask |= mask_map.fetch(current, 0)
  total = 0
  graph[current].each do |neighbor|
    total += count_paths_mask(graph, neighbor, target, mask, mask_map, target_mask, cache)
  end

  cache[key] = total
  total
end

puts "Puzzle 1: #{puzzle1(input)}"
puts "Puzzle 2: #{puzzle2(input)}"
