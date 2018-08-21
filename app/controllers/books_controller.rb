class BooksController < ApplicationController

  def index
    @books = Book.all
    @order_item = current_user.cart.order_items.new
  end

  def show
    @book = Book.find_by(id: params[:id])
    @author = @book.author.name
  end
end
