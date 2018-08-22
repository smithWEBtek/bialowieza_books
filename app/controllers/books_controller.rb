class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find_by(id: params[:id])
    @author = @book.author.name
  end
end
