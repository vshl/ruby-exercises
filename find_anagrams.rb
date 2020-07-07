# frozen_string_literal: true

require 'minitest/autorun'

def find_anagrams(s, p)
  results = []

  return results if p.length > s.length

  if p.length == 1
    s.each_char.with_index do |char, index|
      results << index if char == p
    end
    return results
  end

  char_count = {}
  p.each_char.with_index do |char, index|
    char_count[char] ||= 0
    char_count[s[index]] ||= 0
    char_count[char] += 1
    char_count[s[index]] -= 1
  end

  left = 0
  right = p.length
  while right < s.length
    results << left if char_count.values.all?(&:zero?)
    l_char = s[left]
    r_char = s[right]
    char_count[l_char] += 1 if char_count.key?(l_char)
    char_count[r_char] -= 1 if char_count.key?(r_char)
    left += 1
    right += 1
  end

  results << left if char_count.values.all?(&:zero?)
  results
end

describe '#find_anagrams' do
  it 'finds all anagrams indexes in a string' do
    TESTS = [
      { s: 'abc', p: 'abcd', expected: [] },
      { s: 'abcabc', p: 'a', expected: [0, 3] },
      { s: 'cbaebabacd', p: 'abc', expected: [0, 6] },
      { s: 'abab', p: 'ab', expected: [0, 1, 2] }
    ].freeze
    TESTS.each do |t|
      assert_equal t[:expected], find_anagrams(t[:s], t[:p])
    end
  end
end
