Rails.application.routes.draw do
  resources :hero_powers, only: [:show, :create] do
    resources :heroes, only: :show
  end
  resources :powers, only: [:index, :show, :update]
  resources :heroes, only: [:index, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
