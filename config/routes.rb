Rails.application.routes.draw do

  root to: "homes#top"
  get 'home/about' => 'homes#about', as: 'about'
devise_for :users

post 'books/:id' => 'books#create', as: 'book_path'

 resources :books, only: [:index, :show, :edit]
 resources :users, only: [:show,:edit, :index]


 patch 'users/:id' => 'users#update', as: 'update_user'
end
