def power_of_two(n)
  n.positive? && (n & (n - 1)).zero?
end

# 8.to_s(2) -> 1000
# 7.to_s(2) -> 0111
#              ----
#              &&&&
#              ----
#              0000

puts power_of_two(16)
puts power_of_two(218)
