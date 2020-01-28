def reverse_integer(x)
  sign = x < 0 ? -1 : 1
  res = 0
  x = x.abs
  while x != 0
    res = res * 10 + x % 10
    x /= 10
  end
  res *= sign
  two_pow = (2**31)
  (res > (two_pow - 1) * -1) && (res < (two_pow - 1)) ? res.to_i : 0
end

def run_tests
  actual = 123
  expected = 321
  assert_equal(reverse_integer(actual), expected)
  actual = -456
  expected = -654
  assert_equal(reverse_integer(actual), expected)
end

def assert_equal(a, b)
  puts (a == b ? 'PASS' : 'FAIL').to_s
end

run_tests
