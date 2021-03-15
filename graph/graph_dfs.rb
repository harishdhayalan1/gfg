require 'set'

class Graph
  attr_accessor :ad_list

  def initialize
    self.ad_list = {}
  end

  def add_vertex(vertex)
    self.ad_list[vertex] = Set.new
  end

  def add_edge(from, to)
    ad_list[from].add(to)
    ad_list[to].add(from)
  end

  def print
    ad_list.each do |vertex, edges|
      puts "Vertex is #{vertex}"
      puts "Edges are "
      edges.each { |edge| puts edge }
    end
  end

  def perform_dfs
    visited = Set.new
    ad_list.keys.each do |vertex|
      dfs(vertex, visited) unless visited.member?(vertex)
    end
  end

  def dfs(vertex, visited)
    visited.add(vertex)
    puts vertex.inspect
    ad_list[vertex].each do |curr_vertex|
      next if visited.member?(curr_vertex)
      dfs(curr_vertex, visited)
    end
  end
end


g = Graph.new
g.add_vertex('a')
g.add_vertex('b')
g.add_vertex('c')
g.add_vertex('d')
g.add_vertex('e')
g.add_vertex('f')

g.add_edge('a', 'b')
g.add_edge('c', 'b')
g.add_edge('a', 'e')
g.add_edge('b', 'e')
g.add_edge('c', 'f')

g.perform_dfs
