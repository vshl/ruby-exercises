# frozen_string_literal: true

def product_except_self(nums)
  output = []
  n = nums.size
  product = 1
  (0...n).each do |i|
    product *= nums[i]
    output << product
  end
  product = 1
  (n - 1).downto(1).each do |i|
    output[i] = product * output[i - 1]
    product *= nums[i]
  end
  output[0] = product
  output
end

puts product_except_self([1, 2, 3, 4])
# expected result: [24, 12, 8, 6]
