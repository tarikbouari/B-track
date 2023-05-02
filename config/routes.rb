Rails.application.routes.draw do
 
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root "home#index"

  devise_scope :user do
    authenticated :user do
      root :to => 'groups#index', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'home#index', as: :unauthenticated_root
    end
  end
  

  resources :users do
    resources :groups do 
      resources :entities 
      resources :expenses
    end
  end
  resources :home
end
