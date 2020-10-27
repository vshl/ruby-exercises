def compress_string(string)
  final_length = count_compression(string)
  return string if final_length >= string.length

  compressed = ''
  count_consecutive = 0
  (0...string.length).each do |i|
    count_consecutive += 1

    next unless i + 1 >= string.length || string[i] != string[i + 1]

    compressed += string[i]
    compressed += count_consecutive.to_s
    count_consecutive = 0
  end
  compressed
end

def count_compression(string)
  compress_length = 0
  count_consecutive = 0
  (0...string.length).each do |i|
    count_consecutive += 1
    if i + 1 >= string.length || string[i] != string[i + 1]
      compress_length += 1 + count_consecutive.to_s.length
      count_consecutive = 0
    end
  end
  compress_length
end

describe '#compress_string' do
  it 'compresses string' do
    expect(compress_string('aabcccccaaa')).to eq 'a2b1c5a3'
  end
end
