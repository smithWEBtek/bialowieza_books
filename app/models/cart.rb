class Cart < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :books, through: :order_items

  def self.total
    carts = self.all.map do |cart|
      total = []
      cart.order_items.each do |oi|
        total += oi.book.price
        carts << total
      end
      carts
    end
    carts
  end

end
