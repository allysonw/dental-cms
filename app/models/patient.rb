class Patient < ApplicationRecord
  has_many :user_patients
  has_many :users, through: :user_patients

  validates :name, :dob, :address, :phone_number, presence: true
end
