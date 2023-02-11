class Book
  include ActiveModel::Model

  attr_accessor :title, :description, :keywords, :pitch, :author, :author_url, :chapters, :published_at, :updated_at


  def slug
    title.parameterize
  end


  def first_chapter
    chapters.first
  end


  def next_chapter current_chapter
    chapters[chapters.index(current_chapter) + 1]
  end


  def find_chapter slug
    chapters.find { |chapter| chapter.slug == slug }
  end


  def author
    @author ||= "Perky Crow"
  end


  def updated_at
    @updated_at ||= published_at
  end


  def self.all
    [book1]
  end


  def self.find slug
    all.find { |book| book.slug == slug }
  end


  def self.book1
    new(
      title:        "A JavaScript Odyssey",
      description:  "Embark on a personal journey of game development with A JavaScript Odyssey",
      published_at: "March 2023",
      keywords:     "HTML5, CSS3, Canvas, requestAnimationFrame, no lib, no framework, book",
      pitch:        %{
        Discover my approach to building games from scratch.

        Explore the world of pure JavaScript game development as you follow along with the creation of a mini-game.

        Whether you're a curious non-developer, an advanced developer seeking inspiration, or a beginner looking to build your own tools, this book has something for you.

        With practical insights, this book will show you how to create games without relying on frameworks or libraries.
      },
      author:       "Perky Crow",
      author_url:   "https://www.perkycrow.com",
      chapters: [
        Chapter.new(
          name:        "Prologue",
          title:       "Adobe Flash, A fallen Hero",
          description: "Explore the rise of HTML5 and the fall of Flash in the world of game development with the prologue of A JavaScript Odyssey",
          keywords:    "HTML5, Flash, Adobe, game development, history"
        ),
        Chapter.new(
          name:        "Chapter 1",
          title:       "hello",
          description: ""
        ),
      ]
    )
  end

end
