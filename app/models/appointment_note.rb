class AppointmentNote < ApplicationRecord
  belongs_to :appointment

  validates :content, :appointment_id, presence: true
end
