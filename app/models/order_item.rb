class OrderItem < ApplicationRecord
  belongs_to :cart
  belongs_to :book
  scope :created_before, -> (time) {where("created_at < ?", time) }
  scope :most_popular, -> {order(quantity: :desc).limit(3)}

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
