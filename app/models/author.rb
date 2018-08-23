class Author < ApplicationRecord
  has_many :books
  scope :alphabetical, -> {order(name: :asc).limit(10)}
end
