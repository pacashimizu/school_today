Rails.application.routes.draw do
  root to: "articles#index"
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  get "signup", to: "users#new"
  
  resources :articles do
    collection do
      get :search
    end
  end
  
  resources :article_images, only: [:destroy]
  resources :grades, only: [:index]
  resources :users, only: [:index, :create, :edit, :update, :destroy] do
    collection do
      get :teachers
      get :search
      get :search_teachers
    end
  end

end
