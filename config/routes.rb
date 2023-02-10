Rails.application.routes.draw do
  get 'chapters/prologue'
  root "pages#home"
end
