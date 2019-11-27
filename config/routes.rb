Rails.application.routes.draw do
 
  # get'applications/new'
  match  'requests/new', via: :post
  devise_for :companies
  devise_for :workers
  root 'homes#index'
  resources :requests
  resources :jobs
  resources :transactions
  resources :applications
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
