Rails.application.routes.draw do 
 
  resources :admins 
  # match '/user', to: 'admins#all_user', via: :post
  match 'user' => 'admins#all_user', via: :get
      
 
  # resources :sessions
  # resources :users
  # get 'users#index'
  # get 'admins/user' => 'admins#user'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # match  'users/dashboard', via: :post
  # get 'users#dashboard'
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
