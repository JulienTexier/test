Rails.application.routes.draw do
	root 'items#index'
	resources :join_table_carts_items
  resources :carts, except: [:index, :new]
  resources :profile, only: [:show, :edit, :update] do 
    resources :orders, except: [:destroy]
  end
  resources :items, only: [:index, :show]
  devise_for :users, controllers: {
    registrations: 'registrations'
  }

  namespace :admin do
    resources :users
    resources :items do 
      resources :cat_picture
    end
    resources :profile do 
      resources :orders
    end
    resources :join_items_orders
    resources :join_table_carts_items
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
