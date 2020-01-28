require_relative 'longest_palindrome'

describe LongestPalindrome do
  it 'returns longest palindrome substring' do
    lp = LongestPalindrome.new
    expect(lp.substring('babad')).to eq 3
  end
end
