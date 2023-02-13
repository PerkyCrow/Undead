module BooksHelper

  def book_link_class book
    request.path == book_path(book.slug) ? 'active' : nil
  end

  def book_illustration book, src, alt = nil, title = nil
    illustration("books/#{book.slug.underscore}/#{src}", alt, title)
  end

end
