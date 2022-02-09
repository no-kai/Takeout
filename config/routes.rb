Rails.application.routes.draw do

  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users

  resources :posts
  resources :users, only: [:index,:show,:edit,:update]
  resources :inquirys, onry: [:new,:create]
end
