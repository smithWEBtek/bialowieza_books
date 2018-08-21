# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create users
5.times do
  @user = User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length = 6, max_length = 12),
  )
  @cart = Cart.create(user_id: @user.id)
end

# Create Authors
10.times do
  @author = Author.create(
    name: Faker::Book.author
  )
end
@authors = Author.all.size

# Create Books
20.times do
  @book = Book.create(
    title: Faker::Book.title,
    genre: Faker::Book.genre,
    price: rand(5..30),
    summary: Faker::Hipster.paragraphs(6),
    author_id: rand(1..@authors)
  )
end

@books = Book.all
@users = User.all.size

# Create Order_Items
@books.each do |book|
  OrderItem.create(
    cart_id: rand(1..@users),
    book_id: book.id,
    quantity: rand(1..3)
  )
end
