def palindrome?(str)
  i = 0
  j = str.length - 1
  while i < j
    return false if str[i] != str[j]

    i += 1
    j -= 1
  end
  true
end

def palindrome_2?(num)
  return false if num.negative? || ((num % 10).zero? && num != 0)

  temp = 0
  while num > temp
    temp = (temp * 10) + (num % 10)
    num /= 10
  end
  [temp, temp / 10].include? num
end

def run_tests
  actual = 'vishal'
  expected = false
  assert_equal(palindrome?(actual), expected)
  actual = 'racecar'
  expected = true
  assert_equal(palindrome?(actual), expected)
  actual = 'malayalam'
  expected = true
  assert_equal(palindrome?(actual), expected)
  expected = true
  assert_equal(palindrome_2?(121), expected)
end

def assert_equal(a, b)
  puts (a == b ? 'TRUE' : 'FALSE').to_s
end

run_tests
