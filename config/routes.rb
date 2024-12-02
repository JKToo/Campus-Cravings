Rails.application.routes.draw do
  resources :profiles

  resources :postings do
    resources :comments, only: [ :create ]
  end
  root "postings#index"
  get "sign_up", to: "register#new"
  post "sign_up", to: "register#create"
  delete "logout", to: "sessions#destroy"
  get "logout", to: "sessions#destroy"
  get "sign_in", to: "sessions#sign_in"
  post "sign_in", to: "sessions#create"
  get "order", to: "orders#new"
  post "order", to: "orders#create"
  get "info", to: "profiles#new"
  get "add_post", to: "postings#new"
  post "add_post", to: "postings#create"
  get "request", to: "orders#renderReq"
  patch "request", to: "orders#update"
  post "add_comment", to: "comments#create"
  get "about", to: "postings#about"
  get "home/popular"
  get "home/order"
  # get "home/signin"
  get "home/abouter"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
