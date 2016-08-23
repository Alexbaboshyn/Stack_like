Rails.application.routes.draw do

  namespace :admin do

  end



  namespace :api do

    resources :users

    resource :session, only: [:create, :destroy]

    resources :categories do
      resources :posts
    end

    resource :me, controller: 'users', only: [:show]

    resources :posts do
      resource :likes, only: [:create, :destroy]
      resources :comments
    end

    resources :comments do
      resource :likes, only: [:create, :destroy]
    end

  end
end
