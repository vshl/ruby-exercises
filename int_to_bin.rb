require 'minitest/autorun'

def int_to_bin(num)
  return num.to_s if num < 2

  int_to_bin(num / 2) + (num % 2).to_s
end


describe '#int_to_bin' do
  it 'converts int to binary' do
    assert_equal int_to_bin(2), '10'
    assert_equal int_to_bin(1), '1'
    assert_equal int_to_bin(5), '101'
  end
end
