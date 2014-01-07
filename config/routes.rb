Compplay::Application.routes.draw do
  resources :contacts
  resources :documents

  resources :locations

  resources :clients

  resources :products

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end