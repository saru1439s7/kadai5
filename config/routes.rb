Rails.application.routes.draw do
  devise_for :users
  root :to => "homes#top"
  get "home/about" => "homes#about"
  get "search" => "searches#search"

  resources :users,only: [:show,:edit,:update,:index,:update,:destroy] do
   resource :relationships, only:[:create,:destroy]
   get 'followings', to: 'relationships#followings', as: 'followings'
   get 'followers', to: 'relationships#followers', as: 'followers'
  end

  resources :books,only: [:show,:index,:create,:edit,:update,:destroy] do
   resource :favorites, only: [:create, :destroy]
   resources :book_comments, only: [:create, :destroy]
   resources :followers, only: [:create, :destroy]
  end
  resources :groups do
    get "join" => "groups#join"
    delete 'join' => 'groups#join'
   end
  #get '/search', to: 'searches#search'
end