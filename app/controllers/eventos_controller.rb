# events_controller.rb
class EventsController < ApplicationController
  def index
    # Coloque aqui a lógica para buscar os eventos do calendário
    # Esses eventos devem ser retornados no formato JSON

    eventos = [
      {
        title: 'Evento 1',
        start: '2023-11-01T10:00:00',
        end: '2023-11-01T11:00:00'
      },
      {
        title: 'Evento 2',
        start: '2023-11-03T14:00:00',
        end: '2023-11-03T15:00:00'
      }
      # Adicione mais eventos conforme necessário
    ]

    render json: eventos
  end
end
