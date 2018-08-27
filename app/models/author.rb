class Author < ApplicationRecord
  has_many :books
  scope :alphabetical, -> {order(name: :asc).limit(10)}
  scope :starts_with, -> (name) { where("name like ?", "#{name}%")}

  def first_name
    first_name = self.name.split(' ', 2).first
  end

  def family_name
    family_name = self.name.split(' ', 2).last
  end

  def self.sorted_family_names
    names = []
    self.all.map do |author|
      names << author.family_name
    end
    names.sort
  end
end
