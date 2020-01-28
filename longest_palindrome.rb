# frozen_string_literal: true

class LongestPalindrome
  def substring(_s)
    nil
  end

  def helper(s, l, r)
    while l >= 0 && r < s.length && s[l] == s[r]
      l -= 1
      r += 1
    end
    s[l + 1..r]
  end
end
