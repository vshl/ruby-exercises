# frozen_string_literal: true

def rotate_array(nums, k)
  return [] unless nums

  k = k % nums.size
  n = nums.size - 1

  reverse(nums, 0, n - k)
  reverse(nums, n - k + 1, n)
  reverse(nums, 0, n)
  nums
end

def reverse(nums, start, last)
  while start < last
    temp = nums[start]
    nums[start] = nums[last]
    nums[last] = temp
    start += 1
    last -= 1
  end
end

p rotate_array([1, 2, 3, 4, 5, 6, 7], 3)
