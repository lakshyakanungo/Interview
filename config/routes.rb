Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # post "/users/create", to: "users#create"
  resources :users, only: [:create]
  resources :posts, only: [:create]
  resources :feeds, only: [:index]

  post "follower/follow", to: "followers#follow"
  post "follower/unfollow", to: "followers#unfollow"
end
