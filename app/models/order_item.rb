class OrderItem < ApplicationRecord
  belongs_to :cart
  belongs_to :book
  scope :created_before, -> (time) {where("created_at < ?", time) }
  scope :most_popular, -> {order(quantity: :desc).limit(3)}

  # Person
  #   .select('people.id, people.name, comments.text')
  #   .joins(:comments)
  #   .where('comments.created_at > ?', 1.week.ago)

  # Reports make for a good usage of class scopes, such as "Most Valuable Cart by Customer"
  # where the code would implement a Cart.most_valuable and Cart.by_customer which
  # could be combined as Cart.most_valuable.by_customer(@customer).

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
