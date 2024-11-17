Rails.application.routes.draw do
<<<<<<< HEAD
  resources :chatrooms
  resources :users
  root 'chatrooms#index'
  get "chatrooms/index"
  mount ActionCable.server => "/chatroom"

  #root "chatrooms#index"
  # root "users#index"
=======
  root "pages#home"

>>>>>>> Chats
  resources :chatrooms do
    resources :messages
  end
<<<<<<< HEAD
  #get "/chatrooms", to: "chatrooms#index"
=======

  get "/chatrooms", to: "chatrooms#index"
>>>>>>> Chats
  get "/users", to: "users#index"
  get "/user", to: "users#show"

<<<<<<< HEAD
  resources :users, only: [ :new, :create ]
=======
  resources :users
>>>>>>> Chats
  get "/login", to: "sessions#new"  # For displaying the login form
  post "/login", to: "sessions#create"  # For handling the login submission
  resources :sessions


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
