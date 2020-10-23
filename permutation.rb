def permutation?(string_a, string_b)
  return false unless string_a.length == string_b.length

  char_set = Hash.new(0)
  string_a.each_char do |char|
    char_set[char] += 1
  end
  string_b.each_char do |char|
    char_set[char] -= 1 if char_set.key?(char)

    return false if char_set[char].negative?
  end
  true
end

describe '#permutation' do
  it 'strings are permutations of each other' do
    expect(permutation?('abcd', 'dcba')).to eq true
    expect(permutation?('aabbcc', 'bbccaa')).to eq true
  end

  it 'strings are not permutations of each other' do
    expect(permutation?('abde', 'abca')).to eq false
    expect(permutation?('abcdef', 'abcdee')).to eq false
  end
end
