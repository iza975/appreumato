class Medication < ApplicationRecord
  validates :name, :dose, presence: true
end
  