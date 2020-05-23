Rails.application.routes.draw do
  root to: "products#index"
  devise_for :users
  resources :products do
    collection { get :search }
  end
  get '/about', to: 'static_pages#about'
end
