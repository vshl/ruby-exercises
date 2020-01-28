def maximum_subarray(nums)
  current_max = 0
  current_sum = nums[0]
  nums.each do |num|
    current_sum = [num, num + current_sum].max
    current_max = [current_max, current_sum].max
  end
  current_max
end

def run_tests
  nums = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
  expected = 6
  assert_equal(maximum_subarray(nums), expected)
end

def assert_equal(a, b)
  puts (a == b ? 'TRUE' : 'FALSE').to_s
end

run_tests
