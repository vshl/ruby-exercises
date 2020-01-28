require 'minitest/autorun'

def all_longest_strings(arr)
  arr.group_by(&:size).max.last
end

describe '#all_longest_strings' do
  it 'returns longest strings in an array' do
    TESTS = [
      { arr: ['aba', 'aa', 'ad', 'abc', 'bac'], expected: ['aba', 'abc', 'bac'] }
    ].freeze

    TESTS.each do |t|
      assert_equal t[:expected], all_longest_strings(t[:arr])
    end
  end
end
