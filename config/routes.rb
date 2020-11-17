Rails.application.routes.draw do
  resources :blogs
  root 'blogs#index'
  resources :users
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :blogs do
    resources :comments, only: [:create, :destroy]
  end
  #get 'users/index'
  #get 'users/new'
  #get 'users/create'
  #get 'users/show'
  #get 'users/edit'
  #get 'users/update'
  #get 'users/destroy'
  
  #get 'blogs/index'
  #get 'blogs/new'
  #get 'blogs/create'
  #get 'blogs/show'
  #get 'blogs/edit'
  #get 'blogs/update'
  #get 'blogs/destroy'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end