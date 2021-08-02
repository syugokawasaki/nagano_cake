Rails.application.routes.draw do
  root to: 'public/homes#top'
  get 'about' => 'public/homes#about'

  devise_for :customers



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
