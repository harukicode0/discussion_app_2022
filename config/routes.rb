Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: "rooms#index"
  resources :rooms do
    resources :comments,only:[:create, :destory]
    member do
      post :standing_position
    end
    collection do
      get :search
    end
  end
  resources :users, only: [:show]
end
