Rails.application.routes.draw do
  resources :potential_buyers
  resources :houses
  resources :realtors
  resources :re_companies
  resources :user_roles
  resources :roles
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
