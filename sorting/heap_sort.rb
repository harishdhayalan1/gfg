def heapify(arr, n, i)
  largest = i
  left = (2*i) + 1
  right = (2*i) + 2

  if left < n && arr[left] > arr[largest]
    largest = left
  end

  if right < n && arr[right] > arr[largest]
    largest = right
  end

  if (largest != i)
    arr[largest], arr[i] = arr[i], arr[largest]
    heapify(arr, n, largest)
  end
end

s = gets
arr = s.split(' ').map(&:to_i)
(0..(arr.size()/2)).each do |index|
  heapify(arr, arr.size(), index)
end
(0..arr.size()-1).reverse_each do |index|
  arr[0], arr[index] = arr[index], arr[0]
  heapify(arr, index, 0)
end
puts "Sorted arr is #{arr.inspect}"
