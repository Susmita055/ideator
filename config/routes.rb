Rails.application.routes.draw do

  resources :users
  resources :ideas
  root 'ideas#index'
  get 'about' => 'static_pages#about'
  get 'random' => 'static_pages#random'


end

