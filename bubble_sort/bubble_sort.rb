def bubble_sort(arr)
  long = arr.length

  for i in 0...long
    min = i
    for j in 0...long
      swapp = arr[j], arr[i]
      if arr[i] < arr[j]
        arr[i], arr[j] = swapp
      end
    end
  end
  arr
end 

p bubble_sort([4, 3, 78, 2, 0, 2, 48, 4, 2, 2])
# => [0,2,2,3,4,78]

p bubble_sort([2, 3, 1, 4, 2, 5, 1, 34, 12, 16, 56, 4444, 66, -3, -1, -2])
# => [-3, -2, -1, 1, 1, 2, 2, 3, 4, 5, 12, 16, 34, 56, 66, 4444]
