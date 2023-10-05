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

  def sono
    @sleep_duration = params[:'sleep-duration']
    @restful_sleep = params[:'restful-sleep']
    @woke_up = params[:'woke-up']
    @dreams_nightmares = params[:'dreams-nightmares']
    @sleep_description = params[:'sleep-description']
  end

  def exercicio
    @exercise_confirmation = params[:'exercise-confirmation']
  end
end

