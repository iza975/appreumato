class HomeController < ApplicationController
  before_action :require_login

  def index

    if logged_in?
      @user = current_user
      @medications = Medication.all
    else
      # Trate o caso em que o usuário não está logado
    end

  end

  def dor
    puts params
    @pain_location = params[:'pain-location']
    @pain_intensity = params[:'pain-intensity']
    @pain_description = params[:'pain-description']
    render 'dor'
  end
  
  def remedio
     # Carregar o histórico de medicamentos
    @medications = Medication.where(user_id: current_user.id)
 
  end

  def cria_remedio
    @medication = Medication.create(medication_params)
if @medication.save
      redirect_to root_path, notice: 'Medicamento cadastrado com sucesso!'
    else
      flash[:error] = "Erro ao salvar a medicação. Certifique-se de preencher todos os campos."
    end
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
    @historico_dores = PainRecord.where(user_id: current_user.id)

    # Receba os parâmetros do formulário
    @pain_location = params[:'pain-location']
    @pain_intensity = params[:'pain-intensity']
    @pain_description = params[:'pain-description']
      
       # Verifique se há medicamentos no histórico e defina a mensagem apropriada
    if @historico_remedios.present?
      @historico_medicamentos_message = "Pendente remedio"
    else
      @historico_medicamentos_message = "Nenhum histórico de medicamentos disponível."
    end

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

  def medication_params
    params.require(:medication).permit(:name, :dose, :frequency).merge(user_id:current_user.id)
  end

  def pain_record_params
    params.require(:pain_record).permit(:pain_location, :pain_intensity)
  end

    def pain_record_params
  params.require(:pain_record).permit(:pain_location, :pain_intensity)
end

end
