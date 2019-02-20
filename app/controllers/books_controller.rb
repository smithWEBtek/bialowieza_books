class BooksController < ApplicationController
  before_action :authorize

  def index
    if params[:author_id]
      @books = Book.all.where(author_id: params[:author_id])
    else
      @books = Book.all
    end
    respond_to do |f|
      f.html { render :index }
      f.json {render json: @books}
    end
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

    respond_to do |f|
      f.html { render :index }
      f.json {render json: @book}
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :author_id, :genre, :summary, :price)
  end
end
