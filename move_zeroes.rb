def move_zeroes(nums)
  slow = 0
  fast = 0
  nums.each do |num|
    if num != 0
      nums[slow] = num
      slow += 1
    end
    fast += 1
  end
  while slow < fast
    nums[slow] = 0
    slow += 1
  end
  nums
end

p move_zeroes([0, 1, 0, 3, 12])
