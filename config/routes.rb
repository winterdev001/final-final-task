Rails.application.routes.draw do 
 
  devise_for :administrators
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # get'applications/new'
  match  'requests/new', via: :post
  match  'feedbacks/new', via: :post
  match  'transactions/new', via: :post
  devise_for :companies
  devise_for :workers
  root 'homes#index'
  resources :requests
  resources :jobs
  resources :transactions
  resources :applications
  resources :feedbacks
  match 'workers/index', via: :get
  match 'companies/index', via: :get
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
