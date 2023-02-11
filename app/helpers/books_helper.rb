module BooksHelper

  def book_link_class book
    request.path == book_path(book.slug) ? 'active' : nil
  end

end
