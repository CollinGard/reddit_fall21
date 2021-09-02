Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root
  root 'subs#index'
  # get 'sub#new'
  # http verb 'controller@action'
  # post 'subs#create'
  
  # resources
  resources :subs do
    resources :topics
  end
  
  resources :topics do
    resources :comments
  end  
  # to access it would be localhost:3000/rails/info/routes


end
