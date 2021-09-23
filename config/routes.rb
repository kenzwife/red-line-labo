Rails.application.routes.draw do
  get 'tours/index'
  get 'tours/new'
  get 'tours/create'
  get 'tours/destroy'
  get 'tours/show'
  get 'tours/index2'
  devise_for :users, controllers: {   
  registrations: 'users/registrations',
  sessions: 'users/sessions' }
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tours do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  resources :camps do
    resources :goods, only: [:create, :destroy]
    resources :reviews, only: [:create]
  end

  root 'tours#index'
end  