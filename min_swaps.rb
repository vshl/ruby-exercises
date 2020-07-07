require 'minitest/autorun'

def min_swaps(nums)
  i = 0
  count = 0
  n = nums.size
  while i < n
    if nums[i] != nums[nums[i] - 1]
      swap(nums, i)
      count += 1
    else
      i += 1
    end
  end
  count
end

def swap(nums, i)
  temp = nums[i]
  nums[i] = nums[temp - 1]
  nums[temp - 1] = temp
end

describe '#min_swaps' do
  it 'returns number of swaps to sort an numsay' do
    TEST = [
      { nums: [2,3,1,4], expected: 2 },
      { nums: [1,2,3,4], expected: 0 }
    ]
    TEST.each do |t|
      assert_equal t[:expected], min_swaps(t[:nums])
    end
  end
end
