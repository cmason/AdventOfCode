#!/usr/bin/env ruby

class Update
  @order_rules = nil

  def self.order_rules=(rules)
    @order_rules = rules
  end

  def self.order_rules
    @order_rules
  end

  def initialize(update_str)
    @pages = update_str.split(",").map(&:to_i)
  end

  def valid?
    @pages.each_with_index.all? do |page, i|
      @pages[0...i].none? { |prev_page| Update.order_rules[page].include?(prev_page) }
    end
  end

  def middle_page
    valid? ? @pages[@pages.length / 2] : 0
  end

  def reorder!
    graph = Hash.new { |h, k| h[k] = [] }
    in_degree = Hash.new(0)

    @pages.each do |page|
      Update.order_rules[page].each do |dependent_page|
        if @pages.include?(dependent_page)
          graph[page] << dependent_page
          in_degree[dependent_page] += 1
        end
      end
    end

    queue = @pages.select { |page| in_degree[page].zero? }
    sorted_pages = []

    until queue.empty?
      current = queue.shift
      sorted_pages << current

      graph[current].each do |neighbor|
        in_degree[neighbor] -= 1
        queue << neighbor if in_degree[neighbor].zero?
      end
    end

    @pages = sorted_pages + (@pages - sorted_pages)
    self
  end

  def to_s
    @pages.join(",")
  end
end

rule_str, update_str = ARGF.read.split("\n\n")

rules = Hash.new { |h, k| h[k] = [] }
rule_str.split("\n").each do |line|
  k, v = line.split("|").map(&:to_i)
  rules[k] << v
end

Update.order_rules = rules
updates = update_str.split("\n").map { |line| Update.new(line) }

puts "Puzzle 1: #{updates.sum(&:middle_page)}"
puts "Puzzle 2: #{updates.reject(&:valid?).map(&:reorder!).sum(&:middle_page)}"
