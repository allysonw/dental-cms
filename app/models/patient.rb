class Patient < ApplicationRecord
  has_many :appointments
  has_many :users, through: :appointments, dependent: :destroy

  has_many :treatment_plans, dependent: :destroy
  has_one :address, dependent: :destroy

  validates :name, :dob, :phone_number, presence: true

  accepts_nested_attributes_for :address
end
