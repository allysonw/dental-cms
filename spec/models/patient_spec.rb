require 'rails_helper'

RSpec.describe Patient, :type => :model do
  it "is valid with a name, dob, and phone_number" do
    patient =  FactoryBot.create(:patient)
    expect(patient).to be_valid
  end

  it "is not valid without a name" do
    expect(Patient.new(:dob => "12/15/1967", :phone_number => "415-533-4034")).not_to be_valid
  end

  it "has many appointments" do
    patient = FactoryBot.create(:patient_with_appointments)
    expect(patient.appointments.size).to be > 0
  end

  it "has many users through appointments" do
    patient = FactoryBot.create(:patient_with_appointments)
    expect(patient.users.size).to be > 0
  end

  it "has an address" do
    patient = FactoryBot.create(:patient_with_address)
    expect(patient.address).to_not be_nil
  end

end
