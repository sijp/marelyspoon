Rails.application.routes.draw do
  get "recipe/", to: "recipe#list"
  get "recipe/:id", to: "recipe#details"
  root to: "recipe#list"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
