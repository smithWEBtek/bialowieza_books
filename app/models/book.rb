class Book < ApplicationRecord
  belongs_to :author
  has_many :order_items
  has_many :carts, through: :order_items
  scope :most_expensive, -> {order(price: :desc).limit(3)}
  scope :cheapest, -> {order(price: :asc).limit(3)}
end
