Rails.application.routes.draw do

  devise_for :vendors, path: "vendors"
  devise_for :users, path: "users"
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # everything that is acted by user, go under namespace `user`
  namespace :user do
    # user explore vendors
    # GET /user/vendors
    # GET /user/vendors/1
    resources :guests
    resources :vendors, only: [:index, :show]

    resources :favorite_vendors, only: [:index, :create, :destroy]
    patch "quote/pay", to: "pages#update"
    post "favorite_vendor_exist", to: "favorite_vendors#verify_vendor?"
    get "dashboard", to: "pages#dashboard", as: :dashboard
    get "dashboard/payment", to: "pages#show_invoice"


    resources :inboxes, only: [:index, :create, :show] do
      resources :messages, only: :create
    end

  end

  # everything that is acted by vendor, go under namespace `vendor`
  namespace :vendor do
    # vendor manage items
    # GET /vendor/items
    # GET /vendor/items/1
    resources :products
    get "dashboard", to: "pages#dashboard", as: :dashboard
    post "quote/create", to: "pages#create"
    patch "quote/update", to: "pages#update"

    resources :inboxes, only: [:index, :create, :show] do
      resources :messages, only: :create
    end

  end

end
