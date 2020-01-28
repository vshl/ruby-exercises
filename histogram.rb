# frozen_string_literal: true

dict = {}

words = File.open('/usr/share/dict/words')
words.readlines.each do |word|
  if dict.key?(word[0].downcase)
    dict[word[0].downcase] += 1
  else
    dict[word[0].downcase] = 1
  end
end

_char, largest = dict.max_by { |_k, v| v }

dict.each do |k, v|
  asterisk = (v * 100) / largest
  puts "#{k} #{'*' * asterisk}"
end
