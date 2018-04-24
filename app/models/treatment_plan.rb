class TreatmentPlan < ApplicationRecord
  belongs_to :patient

  has_many :treatments

  validates :name, presence: true
end
