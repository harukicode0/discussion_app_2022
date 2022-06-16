Rails.application.routes.draw do
  root to: "rooms#index"
  resources :room,only: [:index,:show,:create]
end
