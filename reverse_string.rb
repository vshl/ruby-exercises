# frozen_string_literal: true

def reverse_string(string)
  return string if string.length <= 1

  string[-1] + reverse_string(string[1...-1]) + string[0]
end

def reverse_string2(string)
  list = string.split('')
  left_idx = 0
  right_idx = list.size - 1
  while left_idx < right_idx
    list[left_idx], list[right_idx] = list[right_idx], list[left_idx]
    left_idx += 1
    right_idx -= 1
  end
  list.join('')
end

def run_tests
  actual = 'vishal'
  expected = 'lahsiv'
  assert_equal(reverse_string(actual), expected)
  assert_equal(reverse_string2(actual), expected)
end

def assert_equal(a, b)
  puts (a == b ? 'PASS' : 'FAIL').to_s
end

run_tests
