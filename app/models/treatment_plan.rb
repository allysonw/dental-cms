class TreatmentPlan < ApplicationRecord
  belongs_to :patient

  has_many :treatments

  validates :name, presence: true

  def self.for_patient(patient_id)
    where(patient: patient_id)
  end
end
