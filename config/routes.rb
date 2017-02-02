Rails.application.routes.draw do

  resources :comments
  devise_for :users, path: '', path_names:{sign_in: 'login', sign_out:'logout',sign_up: 'register' }
  
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
end
    root to: 'page#home'    
    
    get 'about_me', to: 'page#about'
    get 'contact', to: 'page#contact' 
    get 'tech-news', to: 'page#tech_news'

    resources :blogs do
     member do
         get :toggle_status
     end
    end
  
    get 'portfolios/:id', to: 'portfolios#show', as: 'portfolio_show'
    get 'angular-items', to: 'portfolios#angular'
  end