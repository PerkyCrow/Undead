Rails.application.routes.draw do
  get '/:book_slug', to: 'books#show', as: :book
  get '/:book_slug/:chapter_slug', to: 'chapters#show', as: :chapter

  root "pages#home"
end
