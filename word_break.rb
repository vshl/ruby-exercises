require 'minitest/autorun'

def word_break(s, word_dict)
  dp = [false] * (s.length + 1)
  dp[0] = true
  (0...s.length + 1).each do |i|
    (0...i).each do |j|
      if word_dict.include?(dp[j] && s[j...i])
        dp[i] = true
        break
      end
    end
  end
  dp[-1]
end

describe '#word_break' do
  it 'string can be segmented from the word dict' do
    s = 'leetcode'
    word_dict = %w[leet code]
    assert_equal word_break(s, word_dict), true
  end

  it 'string cannot be segmented from the word dict' do
    s = 'catsandog'
    word_dict = %w[cats dog sand and cat]
    assert_equal word_break(s, word_dict), false
  end
end
