module ChaptersHelper

  def illustration src, alt = nil, title = nil
    render 'chapters/illustration', src: src, alt: alt, title: title
  end

  def render_chapter book, chapter
    render "chapters/#{book.slug.underscore}/#{chapter.name.parameterize.underscore}", book: book, chapter: chapter
  end

  def chapter_link_class book, chapter
    request.path == chapter_path(book.slug, chapter.slug) ? 'active' : nil
  end

end
