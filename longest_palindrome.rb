require 'minitest/autorun'
require 'pry'

def longest_palindrome(s)
  freq_map = s.chars.each_with_object({}) do |x, obj|
    obj[x] ||= 0
    obj[x] += 1
  end
  has_odd = false
  p freq_map.values
  sum = freq_map.values.sum { |x|
    has_odd = true unless has_odd && x.even?
    x.odd? ? x - 1 : x
  }
  sum += 1 if has_odd
  sum
end

describe 'longest_palindrome' do
  it 'returns longest palindrome' do
    s = 'abccccdd'
    expected = 7
    assert_equal expected, longest_palindrome(s)
  end
end
