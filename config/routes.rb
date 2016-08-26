Rails.application.routes.draw do

  namespace :admin do
    resources :categories, only: [:create, :destroy, :update, :show, :index]

    resources :users, only: [:index, :show, :update]

    resources :posts, only: [:index, :show, :destroy]

  end



  namespace :api do

    resources :users, only: [:create, :destroy, :index, :show]

    resource :session, only: [:create, :destroy]

    resources :categories, only: [:index, :show] do
      resources :posts, only: [:index, :create, :show]
    end

    resource :me, controller: 'users', only: [:show, :update]

    resources :posts, only: [:index, :show, :update] do
      resource :likes, only: [:create, :destroy]
      resources :comments
    end

    resources :comments do
      resource :likes, only: [:create, :destroy]
    end

  end
end
