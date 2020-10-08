require 'minitest/autorun'

def sum_of_squares(nums)
  i = 0
  sum = 0
  while i < nums.length
    sum += nums[i].positive? ? nums[i] * nums[i] : 0
    i += 1
  end
  sum
end

describe '#sum_of_squares' do
  it 'sum of squares of integers' do
    nums = [3, -1, 1, 14]
    expected = 206
    assert_equal sum_of_squares(nums), expected
  end
end

