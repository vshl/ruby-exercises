require 'minitest/autorun'

def largest_time_from_digits(arr)
  result = ''
  arr.permutation.each do |p|
    result = [result, p[0].to_s + p[1].to_s + ':' + p[2].to_s + p[3].to_s].max if p[0] * 10 + p[1] <= 23 && p[2] <= 5
  end
  result
end

describe '#largest_time_from_digits' do
  it 'returns largest time from digits' do
    arr = [1, 2, 3, 4]
    expected = '23:41'
    assert_equal largest_time_from_digits(arr), expected
  end

  it 'returns empty string for invalid digits' do
    arr = [5, 5, 5, 5]
    expected = ''
    assert_equal largest_time_from_digits(arr), expected
  end
end
