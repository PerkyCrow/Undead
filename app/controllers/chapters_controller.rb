class ChaptersController < ApplicationController

  layout "book"

  def show
    book_slug = request.path.split("/")[1]
    @book = Book.find(book_slug)
    @chapter = @book.find_chapter(params[:chapter_slug])
  end

end
