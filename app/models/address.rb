class Address < ApplicationRecord
  belongs_to :patient

  validates :street_1, :city, :state, :zip_code, presence: true
end
