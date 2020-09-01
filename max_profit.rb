require 'minitest/autorun'

def max_profit(input)
  max_profit = 0
  x, y = 0
  min_price = input[0]
  (1...input.size).each do |k|
    if input[k] - min_price > max_profit
      max_profit = input[k] - min_price
      y = k + 1
    end
    if min_price > input[k]
      min_price = input[k]
      x = k + 1
    end
  end
  "buy on day %d, sell on day %d" % [x, y]
end

describe '#max_profit' do
  it 'should return max profit while selling a stock' do
    input = [110, 180, 260, 40, 310, 535, 695]
    expected = 'buy on day 4, sell on day 7'
    assert_equal max_profit(input), expected
  end
end
