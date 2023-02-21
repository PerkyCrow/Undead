Rails.application.routes.draw do
  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#internal_server'
  get '/422', to: 'errors#unprocessable'
  get '/406', to: 'errors#unacceptable'

  Book.all.each do |book|
    get "/#{book.slug}", to: 'books#show'
    get "/#{book.slug}/:chapter_slug", to: 'chapters#show'
  end

  # get '/:book_slug', to: 'books#show', as: :book
  # get '/:book_slug/:chapter_slug', to: 'chapters#show', as: :chapter

  root "pages#home"
end
