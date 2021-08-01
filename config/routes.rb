Rails.application.routes.draw do

  devise_for :admin, controllers:{
    sessions: 'admin/sessions'
  }

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    
  end

#:books, only: [:destroy]





  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
