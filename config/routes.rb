Rails.application.routes.draw do
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :users, only: [:show]
  
  #https://qiita.com/hakatatech/items/f991d54ff527edb844d9(Deviceの設定手順)
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 
  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end
  get 'users/:id' => 'users#show' , as: "user"
  get 'users/:id/mypost' => 'users#mypost' ,as: "user_post"
  

 

  # 順番変えただけでエらーはく
  root 'books#index'
  get 'books/favorite' => 'books#favorite'
  get 'books/good_rank' => 'books#ranking'
  get 'books/comment_rank' => 'books#ranking2'
  get 'books/star_rank' => 'books#ranking3'
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
