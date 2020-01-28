# frozen_string_literal: true

def dups(nums)
  return 0 unless nums

  i = 0
  n = nums.size
  while i < n
    if nums[i] != nums[nums[i] - 1] # swap when number's index is out of place
      swap(nums, i) # swap the numbers in-place
    else
      i += 1
    end
  end
  nums[-1] # resulting array will have the duplicate at the end, return the last index
end

def swap(nums, i)
  temp = nums[i]
  nums[i] = nums[temp - 1]
  nums[temp - 1] = temp
end

def dups_2(nums)
  left = 0
  right = nums.size - 1
  while right >= left
    mid = left + (right - left) / 2
    count = 0
    nums.each do |num|
      count += 1 if num <= mid
    end
    if count <= mid
      left = mid + 1
    else
      right = mid - 1
    end
  end
  left
end

p dups_2([1, 1, 2])
p dups_2([3, 2, 1, 2, 4])
p dups([4, 2, 1, 1, 3])
p dups([1, 2, 3, 4, 3])
# p dups([1, 2, 3, 2, 4])
# p dups([1, 4, 2, 3, 4])
# p dups([2, 2, 1, 3, 4])
