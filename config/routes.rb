Rails.application.routes.draw do
  root to: "products#index"

  devise_for :users

  resources :users, only: [:index, :show] do
    member { get :giveaway }
  end

  resources :products do
    collection { get :search }
  end

  get '/about',    to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/giveaway', to: 'static_pages#giveaway'
end
