Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :rooms do
    resources :comments,only:[:create, :destory]
    member do
      post :standing_position
    end
  end
end
