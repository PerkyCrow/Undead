class Book
  include ActiveModel::Model

  attr_accessor :title, :description, :keywords, :pitch, :author, :author_url, :credits, :chapters, :published_at, :updated_at


  def slug
    title.parameterize
  end


  def first_chapter
    chapter = chapters.first
    raise ActionController::RoutingError, "Not Found" unless chapter
    chapter
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


  def cover_path
    "books/#{slug.underscore}/cover.png"
  end



  def self.all
    [book1]
  end


  def self.find slug
    book = all.find { |book| book.slug == slug }
    raise ActionController::RoutingError, "Not Found" unless book
    book
  end


  def self.book1
    new(
      title:        "A JavaScript Odyssey",
      description:  "Embark on a personal journey of game development with A JavaScript Odyssey",
      published_at: "March 2023",
      keywords:     "HTML5, CSS3, Canvas, requestAnimationFrame, no lib, no framework, book",
      pitch:        %{
        Discover our approach to building games from scratch.

        Explore the world of pure **JavaScript game development** as you follow along with the creation of a mini-game.

        Whether you're a **curious** non-developer, an advanced **developer** seeking inspiration, or a **beginner** looking to build your own tools, this book has something for you.

        With practical insights, this book will show you how to create games without relying on frameworks or libraries.
      },
      author:       "Perky Crow",
      author_url:   "https://www.perkycrow.com",
      credits:      %{
        Art & Illustrations by [**Ash**](https://www.instagram.com/ashmosnier/) |
        Written by [**Hugeen**](https://hugeen.com/)
      },
      chapters: [
        Chapter.new(
          name:        "Prologue",
          title:       "A fallen Hero",
          description: "Explore the rise of HTML5 and the fall of Flash in the world of game development with the prologue of A JavaScript Odyssey",
          keywords:    "HTML5, Flash, Adobe, game development, history"
        ),
        Chapter.new(
          name:        "Chapter 1",
          title:       "Fresh start",
          description: "Learn how to create JavaScript games without extra libraries or tools",
          keywords:    "Pure JavaScript, VSCode, chrome, http, server, coding, basics, game development"
        ),
        Chapter.new(
          name:        "Chapter 2",
          title:       "The Canvas",
          description: "",
          keywords:    ""
        ),
        Chapter.new(
          name:        "Chapter 3",
          title:       "Painting a scene",
          description: "",
          keywords:    ""
        ),
        Chapter.new(
          name:        "Chapter 4",
          title:       "Movement",
          description: "",
          keywords:    ""
        ),
        Chapter.new(
          name:        "Chapter 5",
          title:       "Infinite world",
          description: "",
          keywords:    "",
        ),
        Chapter.new(
          name:        "Chapter 6",
          title:       "Bumpin'",
          description: "",
          keywords:    ""
        ),
        Chapter.new(
          name:        "Chapter 7",
          title:       "Interactivity",
          description: "",
          keywords:    ""
        ),
        Chapter.new(
          name:        "Chapter 8",
          title:       "From toy to game",
          description: "",
          keywords:    ""
        ),
        Chapter.new(
          name:        "Chapter 9",
          title:       "End",
          description: "",
          keywords:    ""
        )
      ]
    )
  end

end
