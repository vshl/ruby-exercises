# frozen_string_literal: true

def two_sum(nums, target)
  dict = {}
  nums.each_with_index do |n, i|
    return [target - n], n if dict[target - n]

    dict[n] = i
  end
end

puts two_sum([2, 11, 7, 15], 9)
