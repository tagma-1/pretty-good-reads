Rails.application.routes.draw do
  root 'books#index'
  resources :books
  resources :reviews
  devise_for :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
