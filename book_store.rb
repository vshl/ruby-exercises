class BookStore

  def self.base_price
    8.0
  end

  def self.calculate_price(basket)
    return 0.0 if basket.empty?

    checkout_price = 0
    books_count = number_books(basket).select { |k, v| v > 1 }
    uniq_books = basket.uniq
    checkout_price += uniq_books.size * (base_price - calculate_discount(uniq_books.size))
    checkout_price += books_count.keys.size * (base_price - calculate_discount(books_count.keys.size)) unless books_count.empty?
    checkout_price
  end

  def self.calculate_discount(number_books)
    case number_books
    when 1
      0
    when 2
      base_price * 0.05
    when 3
      base_price * 0.10
    when 4
      base_price * 0.20
    when 5
      base_price * 0.25
    end
  end

  def self.number_books(basket)
    basket.each_with_object(Hash.new(0)) do |book, hash|
      hash[book] += 1
    end
  end

  attr_reader :base_price
end
