Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get 'users/index'
  get 'users/new'
  get 'users/create'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  resources :users
  get 'blogs/index'
  get 'blogs/new'
  get 'blogs/create'
  get 'blogs/show'
  get 'blogs/edit'
  get 'blogs/update'
  get 'blogs/destroy'
  resources :blogs do
    resources :comments, only: [:create]
  end
  root 'blogs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end