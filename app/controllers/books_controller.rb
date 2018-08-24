class BooksController < ApplicationController
  before_action :authorize

  def index
    @books = Book.all
  end

  def new
    @author = Author.find(params[:author_id])
    @book = Book.new
    @book.author = @author
  end

  def create
    @book = Book.new(book_params)
    @book.author = Author.find(params[:author_id])
    @book.save
    redirect_to author_path(@book.author)
  end

  def show
    @order_item = current_user.cart.order_items.new
    @book = Book.find_by(id: params[:id])
    @author = @book.author.name
  end

  private
  def book_params
    params.require(:book).permit(:title, :author_id, :genre)
  end
end
