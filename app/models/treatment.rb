class Treatment < ApplicationRecord
  belongs_to :treatment_plan

  validates :name, :price, presence: true
end
