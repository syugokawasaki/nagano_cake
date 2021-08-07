Rails.application.routes.draw do
  root to: 'public/homes#top'
  get 'about' => 'public/homes#about'

  get 'customers/my_page' => 'public/customers#show'
  get 'customers' => 'public/customers#edit'
  patch 'customers' => 'public/customers#update'
  get 'customers/unsubscribe' => 'public/customers#unsubscribe'
  patch 'customers/withdraw' => 'public/customers#withdraw'
  delete 'cart_items/destroy_all' => 'public/cart_items#destroy_all'

  scope module: :public do
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :update, :create, :destroy]
  end



  devise_for :customers, controllers:{
    registrations: 'public/customers/registrations',
    sessions: 'public/customers/sessions'
  }

  devise_for :admin, controllers:{
    sessions: 'admin/sessions'
  }


  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    root to: 'homes#top'
    resources :orders, only: [:show]
  end

#:books, only: [:destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
