require 'rails_helper'

RSpec.describe Appointment, type: :model do
  let(:andrew) {
    User.create(
      :name => "Doctor Andrew",
      :password => "password",
      :email => "awesman@icloud.com"
    )
  }

  let(:jim) {
    Patient.create(
      :name => "Jim Jones",
      :dob => Time.new(1964, 12, 24, 00, 00),
      :address => "Nowhere, MD",
      :phone_number => "415-533-4034"
    )
  }

  let(:thursday) {
    Appointment.create(
      :time => Time.new(2018, 1, 15, 14, 00),
      :location => "Operatory 4"
    )
  }

  before do
    thursday.patient = jim
    thursday.user = andrew
    thursday.save
  end

  it "is valid with a date, time, and location" do
    expect(thursday).to be_valid
  end

  it "is not valid without a location" do
    expect(Appointment.new(:time => Time.new(2018, 1, 15, 14, 00))).not_to be_valid
  end

  it "belongs to a user" do
    expect(thursday.user).to eq(andrew)
  end

  it "belongs to a patient" do
    expect(thursday.patient).to eq(jim)
  end


end
