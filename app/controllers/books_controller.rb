class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @order_item = current_user.cart.order_items.new
    @book = Book.find_by(id: params[:id])
    @author = @book.author.name
  end
end
