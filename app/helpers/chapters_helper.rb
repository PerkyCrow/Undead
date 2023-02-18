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

  def link_with_icon text, href, icon, target = "_blank"
    link_to text, href, target: target, class: "link_with_icon #{icon}_icon"
  end

  def source_code language, title = nil, &block
    source = capture(&block)

    source.gsub!(/\A\s*\n/, '') # remove first empty line

    render 'chapters/code', language: language, source: source, title: title
  end

end
