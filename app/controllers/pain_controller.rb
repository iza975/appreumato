class PainController < ApplicationController
    def index
      # Qualquer lógica necessária pode ser adicionada aqui
      # Se você precisar passar dados para a view, defina variáveis de instância
      render 'index' # Renderiza a view 'index.html.erb'
    end
  end
  