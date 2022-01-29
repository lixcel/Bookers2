Rails.application.routes.draw do

  root to: "homes#top"
  get 'home/about' => 'homes#about', as: 'about'
devise_for :users

#  post 'books/:id' => 'books#create'


 resources :books, only: [:index, :show, :edit, :destroy,:update, :create] do
   resource :favorites, only: [:create, :destroy]
  end
  
 resources :users, only: [:show,:edit, :index]


 patch 'users/:id' => 'users#update', as: 'update_user'
end
