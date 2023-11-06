# app/models/pain_record.rb

class PainRecord < ApplicationRecord
  belongs_to :user

  # Adicione os atributos necessários
  # attr_accessible :pain_location, :pain_intensity
end
