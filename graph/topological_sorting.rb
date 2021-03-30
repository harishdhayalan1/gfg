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
  end

  def topology_path
    stack = []
    visited = Set.new
    ad_list.keys.each do |vertex|
      topo_path(vertex, stack, visited) unless visited.member?(vertex)
    end

    until stack.empty?
      puts stack.pop
    end
  end

  private

  def topo_path(vertex, stack, visited)
    visited.add(vertex)

    ad_list[vertex].each do |connection|
      next if visited.member?(connection)
      topo_path(connection, stack, visited)
    end

    stack.push(vertex)
  end
end

g = Graph.new
g.add_vertex(0)
g.add_vertex(1)
g.add_vertex(2)
g.add_vertex(3)
g.add_vertex(4)
g.add_vertex(5)

g.add_edge(5,2)
g.add_edge(5,0)
g.add_edge(4,0)
g.add_edge(4,1)
g.add_edge(2,3)
g.add_edge(3,1)

g.topology_path
