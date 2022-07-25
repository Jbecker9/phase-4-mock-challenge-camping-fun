Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get "/campers/custom" to: "campers#custom"
  resources :activities, only: [:index, :destroy]
  resources :campers, only: [:index, :show, :create]
  resources :signups, only: [:create]
  # get "/campers/custom" to: "campers#custom"
end
