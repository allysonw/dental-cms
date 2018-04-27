class TreatmentPlan < ApplicationRecord
  belongs_to :patient

  has_many :treatments, dependent: :destroy

  validates :name, presence: true

  def self.for_patient(patient_id)
    where(patient: patient_id)
  end

  def total_cost
    self.treatments.collect do |treatment|
      treatment.price
    end.reduce(:+)
  end
end
