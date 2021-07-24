Rails.application.routes.draw do
  devise_for :users
  get '/' =>'homes#top', as:'root'
  get 'home/about' => 'homes#about'

  resources :users,only: [:show,:edit,:update,:index,:update,:destroy]
  resources :books

end