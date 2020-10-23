def is_string_unique?(string)
  return false if string.length > 128

  char_set = {}
  string.each_char do |ch|
    return false if char_set[ch]

    char_set[ch] = true
  end
  true
end

describe '#is_string_unique' do
  it 'string is unique' do
    expect(is_string_unique?('a')).to eq true
    expect(is_string_unique?('abc')).to eq true
  end

  it 'string is not unique' do
    expect(is_string_unique?('aa')).to eq false
    expect(is_string_unique?('abcda')).to eq false
    expect(is_string_unique?('abcdefghd')).to eq false
  end
end
