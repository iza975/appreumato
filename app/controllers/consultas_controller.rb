# app/controllers/consultas_controller.rb

class ConsultasController < ApplicationController
  before_action :require_login

  def index
      # Outra lógica do método index se necessário
  end

  def eventos
      if logged_in?
          # Recupere os medicamentos registrados
          medications = current_user.medications  # Supondo que você tenha uma relação entre usuários e medicamentos

          # Converta os medicamentos em eventos para o calendário
          events = medications.map do |medication|
              {
                  title: "Medicação: #{medication.name}",
                  start: medication.start_time.strftime("%Y-%m-%d %H:%M:%S"),
                  end: medication.end_time.strftime("%Y-%m-%d %H:%M:%S"),
                  color: 'blue'  # Cor do evento no calendário (opcional)
              }
          end
      else
          events = []
      end

      render json: events
  end
end
