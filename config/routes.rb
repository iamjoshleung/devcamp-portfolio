Rails.application.routes.draw do
  resources :pfl_items, except: [:show]
  get 'portfolio/:id', to: 'pfl_items#show', as: 'portfolio_show'

  get 'about', to: 'pages#about'

  get 'contact', to: 'pages#contact'

  resources :blogs
  
  root to: 'pages#home'
end
