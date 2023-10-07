Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'


  delete '/logout', to: 'sessions#destroy', as: 'logout'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create] do
    get 'success', on: :member
  end
  

  get 'user_list', to: 'users#index' # Renomeei a rota para listar usuários

  root 'home#index'
  

  get 'dor', to: 'home#dor', as: :dor
  post 'dor', to: 'home#process_dor', as: :process_dor

  get 'remedio', to: 'home#remedio', as: :remedio
  get 'sono', to: 'home#sono', as: :sono
  get 'exercicio', to: 'home#exercicio', as: :exercicio
end
