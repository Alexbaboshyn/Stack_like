Rails.application.routes.draw do

  namespace :admin do

  end



  namespace :api do

    resources :users

    resource :session, only: [:create, :destroy]

    resources :categories do
      resources :posts
    end

    resource :me, only: [:show]

    resources :posts do
      resources :comments
      resources :likes
    end

    resources :comments do
      resources :likes
    end

  end
end
