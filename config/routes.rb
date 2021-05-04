Rails.application.routes.draw do
  resources :comments
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end

  get 'angular-items', to: 'portfolios#angular'

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'tech-news', to: 'pages#tech_news'
  
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolios_show'

  resources :blogs do
  	member do
  		get :toggle_status
  	end
  end

  mount ActionCable.server => '/cable'
  

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end