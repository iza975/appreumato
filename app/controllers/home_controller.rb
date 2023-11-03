
class HomeController < ApplicationController
  before_action :require_login

  def index
    if logged_in?
      @user = current_user
    else
      # Trate o caso em que o usuário não está logado
    end

    # Lógica do FullCalendar
    @events = [] # Inicialize um array vazio para os eventos

    # Supondo que você tenha um modelo chamado Event que contém os eventos do calendário
    @events = Event.all.map do |event|
      {
        title: event.title,
        start: event.start_date,
        end: event.end_date
      }
    end

    # Configuração do FullCalendar
    @calendar_options = {
      header: { left: 'prev,next today', center: 'title', right: 'dayGridMonth,timeGridWeek,timeGridDay' },
      events: @events
    }
  end

  def dor
    puts params
    @pain_location = params[:'pain-location']
    @pain_intensity = params[:'pain-intensity']
    @pain_description = params[:'pain-description']
    render 'dor'
    
  end
  
  def remedio
    @medication_name = params[:'medication-name']
    @medication_dose = params[:'medication-dose']
    @medication_frequency = params[:'medication-frequency']
  end

  def create
    @sleep_record = SleepRecord.new(sleep_record_params)
    if @sleep_record.save
      redirect_to root_path, notice: 'Registro de sono criado com sucesso.'
    else
      render :sono
    end
  end

  def historico
    # Recupere os registros de medicação (ou dor) para o usuário atual
    @historico_remedios = MedicationRecord.where(user_id: current_user.id)
    # Recupere também os registros de dor, se necessário
    @historico_dores = PainRecord.where(user_id: current_user.id)

    # Receba os parâmetros do formulário
    @pain_location = params[:'pain-location']
    @pain_intensity = params[:'pain-intensity']
    @pain_description = params[:'pain-description']
      
    # Crie e salve um novo PainRecord com os dados recebidos
    @pain_record = PainRecord.new(
      user_id: current_user.id,
      pain_location: @pain_location,
      pain_intensity: @pain_intensity,
      pain_description: @pain_description
    )
  
    render 'historico'
  end

  def registrar_dor
    pain_record = PainRecord.new(
      user_id: current_user.id,
      pain_location: params[:'pain-location'],
      pain_intensity: params[:'pain-intensity'],
      pain_description: params[:'pain-description']
    )
puts params
    if pain_record.save
      redirect_to root_path, notice: 'Registro de dor criado com sucesso.'
    end
  end

  private

  def sleep_record_params
    params.require(:sleep_record).permit(:sleep_duration, :restful_sleep, :woke_up, :dreams_nightmares, :sleep_description)
  end

  def require_login
    unless logged_in?
      flash[:danger] = 'Você precisa fazer login para acessar esta página.'
      redirect_to login_path
    end
  end

  def exercicio
    @exercise_confirmation = params[:'exercise-confirmation']
  end
end
