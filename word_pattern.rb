require 'minitest/autorun'

def word_pattern(pattern, str)
  chars = pattern.chars
  words = str.split(' ')
  return false if chars.size != words.size

  char_map = {}
  word_visited = {}
  chars.each_with_index do |char, i|
    word = words[i]
    if char_map[char].nil? && word_visited[word].nil?
      char_map[char] = word
      word_visited[word] = true
    elsif word == char_map[char]
      next
    else
      return false
    end
  end
  true
end

describe '#word_pattern' do
  it 'matches pattern to the word string' do
    pattern = 'abba'
    str = 'dog cat cat dog'
    assert_equal word_pattern(pattern, str), true
  end

  it 'does not match pattern to the word string' do
    pattern = 'aab'
    str = 'dog cat dog'
    assert_equal word_pattern(pattern, str), false
  end
end
