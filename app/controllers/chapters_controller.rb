class ChaptersController < ApplicationController

  layout "book"

  def show
    @book = Book.find(params[:book_slug])
    @chapter = @book.find_chapter(params[:chapter_slug])
  end

end
