s = gets
arr = s.split(' ').map(&:to_i)
(0..arr.size()-2).each do |i|
  min_index = i
  (i+1..arr.size()-1).each do |j|
    min_index = j if arr[min_index] > arr[j]
  end
  if min_index != i
    arr[min_index], arr[i] = arr[i], arr[min_index]
  end
end
puts "Sorted array is #{arr.inspect}"
