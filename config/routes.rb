Rails.application.routes.draw do
  
 
  root to: "homes#top"
  devise_for :users
  resources :users do
    resource :relationships, only: [:create, :destroy,:index]
    get 'followings',on: :member
    get 'followers',on: :member
    
    end
  resources :books do
    resources :postcomments, only:[:destroy,:create]
    resource :favorites,only:[:create,:destroy]
   
  end
  get "home/about" =>"homes#about"
  get "search" =>"searches#search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
