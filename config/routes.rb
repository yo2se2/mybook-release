Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  

 

  # 順番変えただけでエらーはく
  root 'books#index'
  get 'books/favorite' => 'books#favorite'
  get 'books/ranking' => 'books#ranking'
  get 'books/ranking2' => 'books#ranking2'
  get 'books/ranking3' => 'books#ranking3'
  resources :books

  resources :books do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end
  
  """
  get 'books/index' => 'books#index'
  get 'books/favorite' => 'books#favorite'

  #投稿機能のルーティング
  get 'books/new' => 'books#new'
  post 'books' => 'books#create'
  
  get 'books/:id' => 'books#show', as: 'book'

  patch 'books/:id' => 'books#update'
  delete 'books/:id' => 'books#destroy'
  get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  
  """
  #コメントについてのルーティング



end
