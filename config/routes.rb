Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: "rooms#index"
  resources :rooms do
    resources :comments,only:[:show, :create, :destroy] do
      resources :likes,only:[:create, :destroy]
    end
    
    member do
      post :standing_position
    end

    collection do
      get :search
      get :sort_participants
      get :sort_comments
    end
  end
  resources :users, only: [:show]
end
