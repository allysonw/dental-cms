class PatientSerializer < ActiveModel::Serializer
  attributes :id, :name, :dob, :phone_number

  has_many :users
end
