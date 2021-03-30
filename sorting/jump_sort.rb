def jump_search(arr, x)
  m = (arr.size() ** 0.5).to_i
  root = m
  while m < arr.size() do
    return m if arr[m] == x
    if arr[m] > x
      (m-root..m).each do |i|
        return i if arr[i] == x
      end
    end
    m += root
  end
  -1
end

arr = gets.split(' ').map(&:to_i)
x = gets.to_i
puts jump_search(arr, x)
