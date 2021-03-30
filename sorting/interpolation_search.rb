def interpolation_search(arr, x)
  low = 0
  high = arr.size()-1

  while (low < high) && (low > -1) && (high < arr.size()) do
    mid = low + ((x-arr[low]) * (high * low) / (arr[high]*arr[low]))
    return mid if arr[mid] == x
    if arr[mid] < x
      low = mid + 1
    else
      high = mid - 1
    end
  end
  return low if arr[low] == x
  -1
end

arr = gets.split(' ').map(&:to_i)
x = gets.to_i
puts interpolation_search(arr, x)
