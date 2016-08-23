Rails.application.routes.draw do

  namespace :admin do

  end



  namespace :api do

    resources :users, only: [:create, :destroy, :index, :update]

    resource :session, only: [:create, :destroy]

    resources :categories, only: [:index, :show, :create, :update, :destroy] do
      resources :posts, only: [:index, :create]
    end

    resource :me, controller: 'users', only: [:show]

    resources :posts, only: [:index, :show] do
      resource :likes, only: [:create, :destroy]
      resources :comments
    end

    resources :comments do
      resource :likes, only: [:create, :destroy]
    end

  end
end
