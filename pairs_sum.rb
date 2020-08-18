require 'minitest/autorun' 
require 'set'
def pairs_sum(k, a)
  result = Set.new
  calc = Set.new
  a.each do |n|
    c = k - n
    if calc.include?(c)
      res = if n > c
              [n, c]
            else
              [c, n]
            end
      result << res unless result.include?(res)
    end
    calc << n
  end
  result.size
end

a = [1, 3, 4, 0, 5, 6]
k = 4

describe '#pairs_sum' do
  it 'returns pairs of sum' do
    assert_equal(2, pairs_sum(k, a))
  end
end
