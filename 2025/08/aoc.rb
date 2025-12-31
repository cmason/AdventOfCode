#!/usr/bin/env ruby

input = ARGF.read.lines.map(&:chomp)

class UnionFind
  def initialize(n)
    @parent = Array.new(n) { |i| i }
    @size = Array.new(n, 1)
  end

  def find(x)
    @parent[x] = find(@parent[x]) if @parent[x] != x
    @parent[x]
  end

  def union(x, y)
    xr, yr = find(x), find(y)
    return if xr == yr
    if @size[xr] < @size[yr]
      @parent[xr] = yr
      @size[yr] += @size[xr]
    else
      @parent[yr] = xr
      @size[xr] += @size[yr]
    end
  end

  def group_sizes
    roots = @parent.map { |x| find(x) }
    sizes = Hash.new(0)
    roots.each { |r| sizes[r] += 1 }
    sizes.values
  end
end

def puzzle1(input)
  points = input.map { |line| line.split(",").map(&:to_i) }
  n = points.size
  edges = []

  points.each_with_index do |a, i|
    points.each_with_index do |b, j|
      next if i >= j
      dist = Math.sqrt((a[0]-b[0])**2 + (a[1]-b[1])**2 + (a[2]-b[2])**2)
      edges << [dist, i, j]
    end
  end

  edges.sort_by!(&:first)

  uf = UnionFind.new(n)
  edges.first(1000).each { |_, i, j| uf.union(i, j) }

  sizes = uf.group_sizes.sort.reverse
  sizes[0..2].inject(:*)
end

def puzzle2(input)
  points = input.map { |line| line.split(",").map(&:to_i) }
  n = points.size
  edges = []

  points.each_with_index do |a, i|
    points.each_with_index do |b, j|
      next if i >= j
      dist = Math.sqrt((a[0]-b[0])**2 + (a[1]-b[1])**2 + (a[2]-b[2])**2)
      edges << [dist, i, j]
    end
  end

  edges.sort_by!(&:first)

  uf = UnionFind.new(n)
  components = n
  last_edge = nil

  edges.each do |_, i, j|
    if uf.find(i) != uf.find(j)
      uf.union(i, j)
      components -= 1
      last_edge = [i, j]
      break if components == 1
    end
  end

  x1, x2 = points[last_edge[0]][0], points[last_edge[1]][0]
  x1 * x2
end

puts "Puzzle 1: #{puzzle1(input)}"
puts "Puzzle 2: #{puzzle2(input)}"
