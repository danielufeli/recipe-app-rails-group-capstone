Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :foods, only: %i[index]
  resources :recipes, only: %i[index new create show destroy]
  resources :recipe_foods, only: %i[index new edit destroy]

  # Defines the root path route ("/")
  root "recipes#index"
end
