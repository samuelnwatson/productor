Rails.application.routes.draw do
  devise_for :users
  resources :categories
  resources :products
  root to: "categories#index"

  devise_scope :user do
     get '/users/sign_out' => 'devise/sessions#destroy'
   end
end
