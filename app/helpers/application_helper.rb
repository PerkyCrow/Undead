module ApplicationHelper

  def page_title
    "UndeadJS | " + (content_for?(:title) ? content_for(:title) : "A JavaScript Game Development Interactive Book")
  end


  def page_description
    content_for?(:description) ? content_for(:description) : "An interactive book that takes you on a journey of creating a JavaScript video game, with multiple levels of reading."
  end


  def page_keywords
    content_for?(:keywords) ? content_for(:keywords) : "UndeadJS, JavaScript, HTML5, CSS3, Canvas, WebGL, PIXI.js, Game Development, Game Design, Game Art, Game Sound, Game Programming, Indie Game, Browser Game, Flash, Book, Learning"
  end

end
