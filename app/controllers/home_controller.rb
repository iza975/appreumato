class HomeController < ApplicationController

  def index
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

  def exercicio
    @exercise_confirmation = params[:'exercise-confirmation']
  end
end

