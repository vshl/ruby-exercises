def plus_one(digits)
  num = 0
  (0...digits.size).each do |i|
    num += num*10 + digits[i]
  end
  num.to_s.split(//).map { |c| c.to_i }
end
