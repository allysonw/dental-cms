require 'rails_helper'

RSpec.describe TreatmentPlan, type: :model do
  let!(:jim) {
    Patient.create(
      :name => "Jim Jones",
      :dob => Time.new(1964, 12, 24, 00, 00),
      :address => "Nowhere, MD",
      :phone_number => "415-533-4034"
    )
  }

  let!(:implants) {
    :name => "Jim Jones Treatment Plan 10/12/2017"
  }

  it "is valid with a name" do
    expect(implants).to be_valid
  end

  it "is not valid without a name" do
    expect(TreatmentPlan.new).not_to be_valid
  end

  # it "has many treatments" do
  #   expect(jim.appointments.first).to eq(appt1)
  #   expect(jim.appointments.last).to eq(appt2)
  # end
end
