Rails.application.routes.draw do
  root to: "articles#index"
  
  get "signup", to: "users#new"
  resources :users, only: [:index, :create, :edit, :update, :destroy] do
    collection do
      get :teachers
    end
  end

end
