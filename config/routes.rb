Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: "rooms#index"
  resources :rooms do
    resources :comments,only:[:show, :create, :destory] do
      resources :like,only:[:create, :destory]
    end
    member do
      post :standing_position
    end
    collection do
      get :search
      get :sort
    end
  end
  resources :users, only: [:show]
end
