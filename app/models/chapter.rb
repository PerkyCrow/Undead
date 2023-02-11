class Chapter
  include ActiveModel::Model

  attr_accessor :title, :name, :description, :keywords, :type

  def slug
    title.parameterize
  end

end
