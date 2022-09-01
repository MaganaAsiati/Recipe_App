Rails.application.routes.draw do
  devise_for :users

    resources :foods, only: %i[index new create show destroy]
    resources :recipes, only: %i[index new create show destroy] do
      resources :recipe_foods, only: %i[new create]
    end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'users#index'
end
