#!/usr/bin/env ruby

input = ARGF.read.lines.map(&:chomp).map { |line| line.split(",").map(&:to_i) }

def puzzle1(input)
  input.combination(2).map do |(x1, y1), (x2, y2)|
    ((x2 - x1).abs + 1) * ((y2 - y1).abs + 1)
  end.max
end

class Span
  attr_accessor :l, :r

  def initialize(l, r)
    @l, @r = l, r
  end

  def contains?(x)
    x.between?(l, r)
  end

  def intersect(other)
    Span.new([l, other.l].max, [r, other.r].min)
  end

  def to_s
    "[#{l}, #{r}]"
  end
end

class Rect
  attr_accessor :x, :y, :span

  def initialize(x, y, span)
    @x, @y, @span = x, y, span
  end

  def contains?(x_val)
    span.contains?(x_val)
  end

  def intersect_span(other_span)
    @span = span.intersect(other_span)
  end
end

def toggle(edges, value)
  # Insert or remove value from sorted array
  idx = edges.bsearch_index { |v| v >= value }

  if idx && edges[idx] == value
    # Remove
    edges.delete_at(idx)
  elsif idx
    # Insert at idx
    edges.insert(idx, value)
  else
    # Append
    edges << value
  end

  edges
end

def to_spans(edges)
  spans = []
  return spans if edges.empty?

  (0...edges.length).step(2) do |i|
    break if i + 1 >= edges.length
    spans << Span.new(edges[i], edges[i + 1])
  end
  spans
end

def puzzle2(input)
  tiles = input.sort_by { |tile| [tile.last, tile.first] }
  area = 0
  edges = []
  cur_candidates = []

  # Group tiles by y-coordinate
  y_groups = tiles.group_by { |tile| tile[1] }

  y_groups.keys.sort.each do |y|
    xs = y_groups[y].map { |tile| tile[0] }.sort

    # Toggle all x values for this y level
    xs.each do |x|
      edges = toggle(edges, x)
    end

    # Check rectangles with current candidates for all x values
    xs.each do |x|
      cur_candidates.each do |c|
        if c.contains?(x)
          w = (c.x - x).abs + 1
          h = (c.y - y).abs + 1
          area = [area, w * h].max
        end
      end
    end

    # Build spans from edges
    spans = to_spans(edges)

    # Shrink or remove candidates
    nxt_candidates = []
    cur_candidates.each do |c|
      spans.each do |s|
        if s.contains?(c.x)
          c.intersect_span(s)
          nxt_candidates << c
          break
        end
      end
    end

    # Add new candidates
    xs.each do |x|
      spans.each do |s|
        if s.contains?(x)
          nxt_candidates << Rect.new(x, y, s)
          break
        end
      end
    end

    cur_candidates = nxt_candidates
  end

  area
end

puts "Puzzle 1: #{puzzle1(input)}"
puts "Puzzle 2: #{puzzle2(input)}"
