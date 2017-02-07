Rails.application.routes.draw do
  resources :topics, only: [:index, :show]

  devise_for :users, path: '', path_names:{sign_in: 'login', sign_out:'logout', sign_up: 'register' }
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end
  get 'portfolios/:id', to: 'portfolios#show', as: 'portfolio_show'
  get 'angular-items', to: 'portfolios#angular'

  get 'about_me', to: 'page#about'
  get 'contact', to: 'page#contact' 
  get 'tech-news', to: 'page#tech_news'

  resources :blogs do
   member do
       get :toggle_status
   end
  end
  mount ActionCable.server => '/cable'

  root to: 'page#home'
end