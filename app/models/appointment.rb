class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :patient

  has_many :appointment_notes, dependent: :destroy
  
  validates :time, :location, :user_id, :patient_id, presence: true

  def self.for_user(user_id)
    where(user: user_id)
  end

  def self.for_patient(patient_id)
    where(patient: patient_id)
  end

  def self.for_user_and_patient(user_id, patient_id)
    where(user: user_id, patient: patient_id)
  end
end
