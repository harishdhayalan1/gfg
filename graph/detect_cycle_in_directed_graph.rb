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
    return if from.eql?(to)
    ad_list[from].add(to)
  end

  def has_cycle?
    detect_cycle(ad_list.keys.first, Set.new)
  end

  private

  def detect_cycle(vertex, visited)
    visited.add(vertex)
    ad_list[vertex].each do |connection|
      return true if visited.member?(connection)
      visited.add(vertex)
      return detect_cycle(connection, visited)
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

puts g.has_cycle?
