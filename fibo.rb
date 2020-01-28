# frozen_string_literal: true

@cache = [0, 1]
def fib(n)
  return @cache[n] if @cache[n]

  @cache[n] = fib(n - 1) + fib(n - 2)
end

def fib_2(n)
  a = b = 1
  (n-1).times { a, b = b, a + b }
  a
end

p fib(99)
p fib_2(99)
