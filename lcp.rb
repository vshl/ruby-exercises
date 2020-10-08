require 'minitest/autorun'

def lcp(word, suffix)
  cp = 0
  word.chars.each_with_index do |char, idx|
    break if idx == suffix.length
    break if char != suffix[idx]

    cp += 1
  end
  word[0...cp].length
end

describe '#lcp' do
  it 'finds longest common prefix between two strings' do
    a = 'ababa'
    b = 'ababa'
    assert_equal lcp(a, b), 5
    b = 'baba'
    assert_equal lcp(a, b), 0
    b = 'aba'
    assert_equal lcp(a, b), 3
    b = 'ba'
    assert_equal lcp(a, b), 0
    b = 'a'
    assert_equal lcp(a, b), 1
  end
end
