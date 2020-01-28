# frozen_string_literal: true

def unscramble(word_list, input, _splits)
  (0...input.length).each do |i|
    first = input[i..-1]
    second = input[0...i]
    output = "#{first}#{second}".split
    return output.join(' ') if output & word_list == output || output & word_list == word_list
  end
end

puts unscramble(%w[world hello], 'rldhello wo', 1)
puts unscramble(%w[a dog], 'ga do', 1)
