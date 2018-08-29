class AuthorsController < ApplicationController
  before_action :authorize

  def index
    @authors = Author.all
  end

  def show
    @author = Author.find_by(id: params[:id])
    @books = @author.books
    @order_item = current_user.cart.order_items.new
  end

  def authors_list
    @authors = Author.all.most_published
  end

end
