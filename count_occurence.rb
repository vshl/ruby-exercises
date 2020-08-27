require 'minitest/autorun'

def count_occurrence(str, word)
  arr = str.split(' ')
  count = 0
  arr.each do |i|
    count += 1 if i == word
  end
  count
end

describe '#count_occurrence' do
  let(:string) { 'a quick brown fox jumps over the lazy dog' }

  it 'returns occurrence of word in string' do
    word = 'brown'
    expected = 1
    assert_equal count_occurrence(string, word), expected
  end
end
