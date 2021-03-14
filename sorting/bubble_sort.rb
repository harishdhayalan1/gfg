s = gets
arr = s.split(' ').map(&:to_i)
while true do
  swapped = false
  (1..arr.size()-1).each do |i|
    if arr[i-1] > arr[i]
      swapped = true
      arr[i], arr[i-1] = arr[i-1], arr[i]
    end
  end
  break unless swapped
end
puts "Sorted array is #{arr.inspect}"
