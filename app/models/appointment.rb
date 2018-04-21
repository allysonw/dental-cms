class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :patient

  validates :time, :location, :user_id, :patient_id, presence: true
end
