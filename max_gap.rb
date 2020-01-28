# frozen_string_literal: true

def max_gap(nums)
  return 0 if nums.size < 2

  return nums[-1] - nums[0] if num.size == 2

  size = nums.size
  min_e = nums.min
  max_e = nums.max
  bucket_size = (max_e - min_e) / (size - 1)
  bucket_num = (max_e - min_e) / size + 1
  buckets = (0..bucket_num).map { [nil, nil] }

  nums.each do |num|
    next if num == min_e || num == max_e

    bucket = buckets[(num - min_e) / bucket_size]
    bucket[0] = bucket[0].nil? ? num : [bucket[0], num].min
    bucket[1] = bucket[1].nil? ? num : [bucket[1], num].max
  end
  buckets = buckets.reject { |b| b[0].nil? }
  gap = 0
  (1...buckets.size).each do |i|
    gap = [gap, buckets[i][0] - buckets[i - 1][1]].max
  end
  gap
end

def max_profit(prices)
  max_profit = 0
  min_price = prices[0]
  (1...prices.size).each do |k|
    max_profit = prices[k] - min_price if max_profit < prices[i] - min_price
    min_price = prices[k] if prices[k] < min_price
  end
  max_profit
end

# puts max_gap([3, 6, 9, 1])
puts max_gap([1, 1_000_000])
