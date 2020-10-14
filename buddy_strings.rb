require 'set'

def buddy_strings(a, b)
  return false unless a.length == b.length

  if a == b
    seen = Set.new
    a.each_char do |ch|
      return true if seen.include?(ch)

      seen << ch
    end
    false
  else
    pairs = []
    a.chars.zip(b.chars).each do |c, d|
      pairs << [c, d] if c != d
      return false if pairs.size >= 3
    end
    pairs.size == 2 && pairs[0] == pairs[1].reverse
  end
end

describe '#buddy_strings' do
  context 'when characters are the same' do
    it 'they are buddy strings' do
      expect(buddy_strings('aa', 'aa')).to be true
    end

    it 'they are not buddy strings' do
      expect(buddy_strings('abc', 'abc')).to be false
    end
  end

  context 'when characters are not the same' do
    it 'they are buddy strings' do
      expect(buddy_strings('ab', 'ba')).to be true
      expect(buddy_strings('aaaaabc', 'aaaaacb')).to be true
    end

    it 'they are not buddy strings' do
      expect(buddy_strings('abcd', 'dabc')).to be false
      expect(buddy_strings('aabcd', 'aacdb')).to be false
      expect(buddy_strings('aaaadd', 'aaaacc')).to be false
    end
  end

  context 'when string lengths do not match' do
    it 'they are not buddy strings' do
      expect(buddy_strings('aac', 'aa')).to be false
    end
  end
end
