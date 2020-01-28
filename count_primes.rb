def count_primes(n)
  mark = [false] * (n + 1)
  counter = 0
  (2...n).each do |i|
    next if mark[i] == true

    counter += 1
    (i * i).step(n, i) { |j| mark[j] = true }
  end
  counter
end

def sieve(n)
  return [] if n < 2

  lot = []
  mark = [false] * (n + 1)
  (2..n).each do |number|
    next if mark[number] == true

    lot << number
    (number * number).step(n, number) do |j|
      mark[j] = true
    end
  end
  lot
end

puts count_primes(10)
