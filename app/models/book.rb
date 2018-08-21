class Book < ApplicationRecord
  belongs_to :author
  has_many :order_items
  has_many :carts, through: :order_items
end
