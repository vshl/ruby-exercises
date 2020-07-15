# frozen_string_literal: true

def two_sum(nums, target)
  dict = {}
  result = []
  nums.each_with_index do |n, i|
    result << [dict[target - n], i] if dict.key?(target - n)

    dict[n] = i
  end
  result
end

def three_sum(nums)
  dict = {}
  result = []
  nums.sort!
  nums.each_with_index do |n, i|
    next if dict.key?(n)

    two_sum(nums[i + 1..-1], 0 - n).each do |pair|
      result << [n] + pair.map { |j| nums[i + j + 1] }
    end
    dict[n] = i
  end
  result.uniq
end

# p two_sum([2, 11, 7, 15], 9)
p three_sum([-1, 0, 1, 2, -1, -4])
