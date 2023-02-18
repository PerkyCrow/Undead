module ApplicationHelper

  def page_title
    "undead.js | " + (content_for?(:title) ? content_for(:title) : "A collection of JavaScript Game Development Interactive Books")
  end


  def page_description
    content_for?(:description) ? content_for(:description) : "A collection of interactive books that takes you on a journey of creating JavaScript video games, with multiple levels of reading."
  end


  def page_keywords
    base_keywords = "undead.js, JavaScript, Game Development, Game Design, Game Art, Game Sound, Game Programming, Indie Game Dev".split(", ")

    if content_for?(:keywords)
      base_keywords << content_for(:keywords).split(", ")
    end

    base_keywords.flatten.map(&:downcase).uniq.join(", ")
  end


  def page_author
    content_for?(:author) ? content_for(:author) : "Perky Crow"
  end


  def numeral_to_roman string
    roman_numerals = {
      1000 => "M",
      900  => "CM",
      500  => "D",
      400  => "CD",
      100  => "C",
      90   => "XC",
      50   => "L",
      40   => "XL",
      10   => "X",
      9    => "IX",
      5    => "V",
      4    => "IV",
      1    => "I"
    }

    words = string.split(" ")

    words.map! do |word|
      if word.to_i.to_s == word
        number = word.to_i
        roman_numeral = ""
        roman_numerals.each do |value, symbol|
          while number >= value
            roman_numeral += symbol
            number -= value
          end
        end
        roman_numeral
      else
        word
      end
    end

    words.join(" ")
  end


  def simple_markdown string
    renderer = Redcarpet::Render::HTML.new
    markdown = Redcarpet::Markdown.new(renderer, extensions = {})
    string = string.split("\n").map { |line| line.strip }.join("\n")

    markdown.render(string).html_safe
  end


end
