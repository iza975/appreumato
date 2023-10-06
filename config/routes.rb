Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy', as: 'logout'
  get '/logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'


  root 'home#index'

  get 'dor', to: 'home#dor', as: :dor
  post 'dor', to: 'home#process_dor', as: :process_dor # Altere o alias para esta rota

  get 'remedio', to: 'home#remedio', as: :remedio
  get 'sono', to: 'home#sono', as: :sono
  get 'exercicio', to: 'home#exercicio', as: :exercicio
end
