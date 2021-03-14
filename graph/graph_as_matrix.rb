class Graph
  attr_accessor :n, :vertices_map, :connections, :index_map

  def initialize(n)
    self.n = n
    self.vertices_map = {}
    self.connections = n.times.map { |i| [-1]*n }
    self.index_map = Array.new(n)
  end

  def add_vertix(index, vertix)
    # map to store { 'a' => 0 } and list to access by index ['a']
    vertices_map[vertix] = index
    index_map[index] = vertix
  end

  def add_edge(from, to)
    # add two way connection for undirected graph.
    connections[vertices_map[from]][vertices_map[to]] = 1
    connections[vertices_map[to]][vertices_map[from]] = 1
  end

  def print
    vertices_map.each do |vertix, index|
      puts "Vertex #{vertix}"
      puts "Edges are "
      connections[index].each_with_index { |value, curr_index| puts index_map[curr_index] if value != -1 }
    end
  end
end

g = Graph.new(2)
g.add_vertix(0, 'a')
g.add_vertix(1, 'b')
g.add_edge('a', 'b')

g.print
