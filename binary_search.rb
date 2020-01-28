def binary_search(nums, target)
  return -1 if nums.empty?

  left = 0
  right = nums.size - 1

  while right >= left
    mid = left + (right - left) / 2
    return mid if nums[mid] == target

    if nums[mid] < target
      left = mid + 1
    else
      right = mid - 1
    end
  end
  -1
end

p binary_search([1, 2, 3], 2)
p binary_search([1, 3, 5, 7, 9], 7)
