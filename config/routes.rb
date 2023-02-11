Rails.application.routes.draw do
  get '/:book_name', to: 'books#show', as: 'book'
  get '/:book_name/:chapter_name', to: 'chapters#show', as: 'chapter'

  root "pages#home"
end
