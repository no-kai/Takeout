Rails.application.routes.draw do

  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  get 'searchs/top'
  get '/search' => 'searchs#search', as: 'search'
  devise_for :users


  resources :posts do
    resources :comments, only: [:create,:destroy]
    resources :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:index,:show,:edit,:update]
  resources :inquirys, onry: [:new,:create]
end
