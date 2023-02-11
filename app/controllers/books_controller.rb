class BooksController < ApplicationController

  layout "book"

  def show
    @book = Book.find(params[:book_slug])
  end

end
