require 'minitest/autorun'

def reverse_array(nums)
  i = 0
  j = nums.size - 1
  while i < j
    temp = nums[i]
    nums[i] = nums[j]
    nums[j] = temp
    i += 1
    j -= 1
  end
  nums
end

describe '#reverse_array' do
  it 'reverses array of integers' do
    TESTS = [
      { nums: [1, 2, 3, 4], expected: [4, 3, 2, 1] },
      { nums: [2, 4, 6, 8], expected: [8, 6, 4, 2] }
    ].freeze
    TESTS.each do |t|
      assert_equal t[:expected], reverse_array(t[:nums])
    end
  end
end
