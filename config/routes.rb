Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: {
    # registrations: 'users/registrations'
  }

  root to: "rooms#index"
  resources :rooms do
    resources :issues do
      resources :issue_comments, only: [:create, :update, :edit, :destroy] do
        resources :issue_likes, only: [:create, :destroy]
      end
    end
    resources :comments, only: [:create,:edit,:update, :destroy] do
      resources :likes, only: [:create, :destroy]
    end

    member do
      post :standing_position
      get :sort_following
    end

    collection do
      get :this_site
      get :tag_search
      get :sort_participants
      get :sort_comments
    end
  end

  resources :users, only: [:show] do
    resource :relationships, only: [:create, :destroy]
    get :followings, on: :member
    get :followers, on: :member
    get :your_joined_discussions, on: :member
  end

  # if Rails.env.development?
  #   mount LetterOpenerWeb::Engine, at: "/letter_opener"
  # end
end
