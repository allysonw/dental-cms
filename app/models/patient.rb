class Patient < ApplicationRecord
  has_many :appointments
  has_many :users, through: :appointments, dependent: :destroy
  # TODO currently all appointments for a patient are detroyed if the patient is deleted
  # Fix so a patient can be deleted but we can maintain their appointment records

  has_many :treatment_plans, dependent: :destroy
  has_one :address, dependent: :destroy

  validates :name, :dob, :address, :phone_number, presence: true
end
