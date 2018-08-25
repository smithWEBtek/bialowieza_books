class Book < ApplicationRecord
  belongs_to :author
  has_many :order_items
  has_many :carts, through: :order_items
  scope :most_expensive, -> {order(price: :desc).limit(3)}
  scope :cheapest, -> {order(price: :asc).limit(3)}
  scope :alphabetical, -> {order(title: :asc).limit(10)}
  before_save :make_title_case

  def make_title_case
    self.genre = self.genre.titlecase 
    self.title = self.title.titlecase
  end
end
