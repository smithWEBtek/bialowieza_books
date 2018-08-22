class OrderItem < ApplicationRecord
  belongs_to :cart
  belongs_to :book

  def book_title
    self.book.title
  end

  def book_price
    self.book.price
  end

  def book_summary
    self.book.summary
  end

  def author_name
    self.book.author.name
  end

  def calculate_total
    self.cart.order_items.collect { |oi| oi.book.price * oi.quantity }.sum
  end
end
