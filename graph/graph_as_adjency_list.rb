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
    self.ad_list[from].add(to)
    self.ad_list[to].add(from)
  end

  def print
    ad_list.each do |vertex, edges|
      puts "Vertex is #{vertex}"
      puts "Edges are "
      edges.each { |edge| puts edge }
    end
  end
end


g = Graph.new
g.add_vertex('a')
g.add_vertex('b')
g.add_vertex('c')
g.add_vertex('d')

g.add_edge('a', 'b')
g.add_edge('c', 'b')

g.print
