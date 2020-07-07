def multiples
  sum = 0
  (1...1000).each do |number|
    sum += number if multiple_of_3?(number) || multiple_of_5?(number)
  end
  sum
end

def multiple_of_3?(number)
  (number % 3).zero?
end

def multiple_of_5?(number)
  (number % 5).zero?
end

puts multiples
