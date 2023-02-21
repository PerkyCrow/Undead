class BooksController < ApplicationController

  layout "book"

  def show
    slug = request.path.split("/")[1]
    @book = Book.find(slug)
  end

end
