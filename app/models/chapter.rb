class Chapter
  include ActiveModel::Model

  attr_accessor :title, :description, :name, :content, :type

  def slug
    title.parameterize
  end

end
