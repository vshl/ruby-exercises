def decompress_string(s)
  stack = []
  s.each_char do |char|
    if char == ']'
      sub_string = ''
      while (temp_char = stack.pop) != '['
        sub_string << temp_char
      end

      number = ''
      number << stack.pop while stack[-1]&.match(/\d/)

      number = number.reverse.to_i
      sub_string = sub_string.reverse * number
      sub_string.each_char { |c| stack.push(c) }
    else
      stack.push(char)
    end
  end
  stack.join('')
end

p decompress_string('2[a]3[bc]')
p decompress_string('1[a2[bc]]')
p decompress_string('3[ab2[c]]')

# Simple iterative solution using stack, using LIFO
#
# 1. Breakdown problem by identifying '[', and ']', add sub-string of characters until ']' is encountered
#
# 2. Idenfity sub-string add it to the stack, until '[' is encountered (LIFO)
# 3. Since it's a stack, the last elements will be the number
# 4. Reverse the number and convert to integer
# 5. Mutate string by multiplying integer with sub-string
# 6. Add substring result back to the stack
# 7. Join stack
# 8. O(n) runtime
#
