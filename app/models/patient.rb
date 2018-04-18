class Patient < ApplicationRecord
  has_many :users_patients
  has_many :users, through: :users_patients
end
