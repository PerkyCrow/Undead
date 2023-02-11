module ChaptersHelper

  # def render_chapter chapter, &block
  #   render 'chapters/chapter', chapter: chapter, content: capture(&block)
  # end


  def illustration src, alt = nil, title = nil
    render 'chapters/illustration', src: src, alt: alt, title: title
  end


  def render_chapter book, chapter
    render "chapters/#{book.slug.underscore}/#{chapter.name.parameterize.underscore}", book: book, chapter: chapter
  end

end
