Rails.application.routes.draw do
  devise_for :users
  
  get 'home/index'

  authenticated :user do
    resources :categories do
      resources :purchases
    end
  end

  root "home#index"
end
