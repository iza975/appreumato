class ConsultasController < ApplicationController
    before_action :require_login
  
    def index
      # Outra lógica do método index se necessário
    end
  
    def agendar_consulta
        # Se o formulário de agendamento for enviado (quando o usuário clica em "Salvar")
        if request.post?
          # Lógica para salvar a consulta
      
          if consulta.save
            flash[:notice] = "Consulta agendada com sucesso!"
            redirect_to root_path
          else
            flash.now[:alert] = "Erro ao agendar a consulta. Verifique os dados do formulário."
            render :agendar_consulta
          end
        else
          # Se não for um pedido POST, renderize a página de agendamento
          render :agendar_consulta
        end
      end

      def save_agendamento
        # Lógica para salvar a consulta
    
        if consulta.save
          redirect_to root_path, notice: "Consulta agendada com sucesso!"
        else
          flash.now[:alert] = "Erro ao agendar a consulta. Verifique os dados do formulário."
          render :agendar_consulta
        end
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


    private

    def require_login
        unless logged_in?
        flash[:danger] = 'Você precisa fazer login para acessar esta página.'
        redirect_to login_path
        end
    end

  end
  