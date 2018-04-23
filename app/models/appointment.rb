class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :patient

  has_many :appointment_notes

  validates :time, :location, :user_id, :patient_id, presence: true
end
