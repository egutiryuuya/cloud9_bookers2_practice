Rails.application.routes.draw do
  
  get 'favorites/create'
  get 'favorites/destroy'
  root to: "homes#top"
  devise_for :users
  resources :users
  resources :books do
    resources :postcomments, only:[:destroy,:create]
    resource :favorites,only:[:create,:destroy]
  end
  get "home/about" =>"homes#about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
