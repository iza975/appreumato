# app/controllers/consultas_controller.rb
class ConsultasController < ApplicationController
    def index
      # Lógica para recuperar as consultas e passá-las para a view
    end
  end

  def index
    @consultas = Consulta.all  # Consulta todos os registros de consultas no banco de dados
  end
  
  class ConsultasController < ApplicationController
    def eventos
      # Coloque aqui a lógica para buscar as consultas/eventos do calendário
      # Essas consultas/eventos devem ser retornados no formato JSON
  
      # Exemplo de eventos em formato JSON:
      eventos = [
        {
          title: 'Consulta 1',
          start: '2023-11-01T10:00:00',
          end: '2023-11-01T11:00:00'
        },
        {
          title: 'Consulta 2',
          start: '2023-11-03T14:00:00',
          end: '2023-11-03T15:00:00'
        }
        # Adicione mais eventos conforme necessário
      ]
  
      render json: eventos
    end
  end
  