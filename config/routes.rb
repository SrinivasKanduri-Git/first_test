Rails.application.routes.draw do
  root 'recipes#index'
  resources :recipes
  resources :ingredients
  resources :recipe_types
end
