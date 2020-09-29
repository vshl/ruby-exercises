require 'minitest/autorun'

def largest_number(nums)
  nums.sort! { |a, b| b.to_s + a.to_s <=> a.to_s + b.to_s }
  return '0' if nums[0].zero?

  nums.join('')
end

def largest_number_2(num)
  num_str = num.to_s
  if num >= 0
    (0...num_str.length).each do |i|
      return (num_str[0...i] + '5' + num_str[i..-1]).to_i if num_str[i] < '5'
    end
  else
    (0...num_str.length).each do |i|
      return (num_str[0...i] + '5' + num_str[i..-1]).to_i if num_str[i] > '5'
    end
  end
end

describe '#largest_number' do
  it 'return largest number from array' do
    nums = [10, 2]
    assert_equal largest_number(nums), '210'
    nums = [1, 5, 3, 6]
    assert_equal largest_number(nums), '6531'
  end

  it 'gives largest possible value after inserting a digit 5' do
    num = 1234
    expected = 51_234
    assert_equal largest_number_2(num), expected
    num = 763
    expected = 7653
    assert_equal largest_number_2(num), expected
    num = 0
    expected = 50
    assert_equal largest_number_2(num), expected
    num = -745
    expected = -5745
    assert_equal largest_number_2(num), expected
    num = -7
    expected = -57
    assert_equal largest_number_2(num), expected
  end
end
