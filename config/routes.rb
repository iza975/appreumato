Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  get 'password_reset', to: 'password_resets#new'
  post 'password_reset', to: 'password_resets#create'
  
  # Rotas para redefinição de senha
  get 'password_resets/new', to: 'password_resets#new', as: 'new_password_reset'
  post 'password_resets', to: 'password_resets#create'

  get 'password_resets/edit', to: 'password_resets#edit', as: 'edit_password_reset'
  patch 'password_resets/update', to: 'password_resets#update'
  
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create] do
    get 'success', on: :member
  end

  get 'eventos', to: 'consultas#eventos'
  
  resources :medications

  get 'user_list', to: 'users#index' # Renomeei a rota para listar usuários

  root 'home#index'
  post 'registrar_dor', to: 'home#registrar_dor', as: :registrar_dor
  
  get 'historico', to: 'home#historico', as: :historico

  get '/consultas', to: 'consultas#index'
  get 'eventos', to: 'consultas#eventos'


  get '/dor', to: 'home#dor', as: :dor
  post 'dor', to: 'home#process_dor', as: :process_dor

  get 'remedio', to: 'home#remedio', as: :remedio
  get 'sono', to: 'home#sono', as: :sono
  get 'exercicio', to: 'home#exercicio', as: :exercicio
end
