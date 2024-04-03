Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'setup/index'

  get 'personnels/personnel_index'
  get 'personnels/personnel_new'
  post 'personnels/personnel_create'
  get 'personnels/personnel_edit'
  post 'personnels/personnel_update'
  get 'personnels/personnel_destroy'

  get 'personnels/item_index'
  get 'personnels/item_new'
  post 'personnels/item_create'
  get 'personnels/item_edit'
  post 'personnels/item_update'
  get 'personnels/item_destroy'


  get 'current_user' => "personnels#current_user"
  get "sessions/new"

  get "log_in" => 'sessions#new', :as => "log_in"
  get "sign_up" => 'personnels#new', :as => "sign_up"
  root :to => 'personnels#new'
  resources :sessions
end
