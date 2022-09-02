Rails.application.routes.draw do
  get 'public_recipes/index'
  devise_for :users


    resources :foods, only: %i[index new create show destroy]
    resources :recipes, only: %i[index new create show destroy] do
      resources :recipe_foods, only: %i[new create]
    end

  resources 'general_shopping_list', only: %w[index] 
  resources :public_recipes, only:%i[index new create show ]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'users#index'
end
