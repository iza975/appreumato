class HomeController < ApplicationController
  before_action :require_login

  def index
    if logged_in?
      @user = current_user
    else
      # Trate o caso em que o usuário não está logado
    end
  end

  def dor
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
