class AuthorsController < ApplicationController

  def index
    @authors = Author.all
  end

  def show
    @author = Author.find_by(id: params[:id])
    @books = @author.books
    @order_item = current_user.cart.order_items.new
  end
end
