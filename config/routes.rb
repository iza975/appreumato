Rails.application.routes.draw do
  root 'home#index'

  get 'dor', to: 'home#dor', as: :dor
  post 'dor', to: 'home#process_dor', as: :process_dor # Altere o alias para esta rota

  get 'remedio', to: 'home#remedio', as: :remedio
  get 'sono', to: 'home#sono', as: :sono
  get 'exercicio', to: 'home#exercicio', as: :exercicio
end
