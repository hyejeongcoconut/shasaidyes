Rails.application.routes.draw do

  devise_for :vendors
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users ,only: [] do
    resources :guests
  end

  resources :vendors ,only: [:index,:show] do
    resources :products
  end

end
