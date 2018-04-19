class Patient < ApplicationRecord
  has_many :appointments
  has_many :users, through: :appointments

  validates :name, :dob, :address, :phone_number, presence: true
end
