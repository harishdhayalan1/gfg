=begin

An undirected graph is a tree if it satisfies following properties

1. It should by Acyclic
2. All the vertices should be connected.

=end
require 'set'

class Graph
  attr_accessor :ad_list

  def initialize
    self.ad_list = {}
  end

  def add_vertex(vertex)
    ad_list[vertex] = Set.new unless ad_list.key?(vertex)
  end

  def add_edge(from, to)
    ad_list[from].add(to)
    ad_list[to].add(from)
  end

  def is_tree?
    visited = Set.new
    !has_cycle(ad_list.keys.first, visited, nil) && (ad_list.keys - visited.to_a).empty?
  end

  private

  def has_cycle(vertex, visited, parent)
    visited.add(vertex)
    ad_list[vertex].each do |connection|
      unless visited.member?(connection)
        return has_cycle(connection, visited, vertex)
      end

      if connection != parent
        return true
      end
    end
    false
  end
end

g = Graph.new

g.add_vertex('a')
g.add_vertex('b')
g.add_vertex('c')

g.add_edge('a', 'b')
g.add_edge('b', 'c')

puts g.is_tree?
