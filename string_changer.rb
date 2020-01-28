class StringChanger
  def reverse_and_save(string)
    string.reverse
  end

  def factorial(num)
    fact = 1
    for i in 1..num
      fact = fact * i
    end

    fact
  end

  def double(n)
    n * 2
  end
end
