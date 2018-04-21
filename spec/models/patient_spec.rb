require 'rails_helper'

RSpec.describe Patient, :type => :model do
  let!(:andrew) {
    User.create(
      :name => "Doctor Andrew",
      :password => "password",
      :email => "awesman@icloud.com"
    )
  }

  let!(:allyson) {
    User.create(
      :name => "Doctor Allyson",
      :password => "password",
      :email => "allysonwesman@icloud.com"
    )
  }

  let!(:jim) {
    Patient.create(
      :name => "Jim Jones",
      :dob => Time.new(1964, 12, 24, 00, 00),
      :address => "Nowhere, MD",
      :phone_number => "415-533-4034"
    )
  }

  let!(:appt1) { Appointment.create(
    :time => Time.new(2018, 7, 24, 11, 00),
    :location => "Operatory 2",
    :patient_id => jim.id,
    :user_id => andrew.id
  )}

  let!(:appt2) { Appointment.create(
    :time => Time.new(2019, 12, 24, 13, 00),
    :location => "Operatory 4",
    :patient_id => jim.id,
    :user_id => allyson.id
  )}

  it "is valid with a name, dob, address, and phone_number" do
    expect(jim).to be_valid
  end

  it "is not valid without a name" do
    expect(Patient.new(:dob => "12/15/1967", :address => "Nowhere, MD", :phone_number => "415-533-4034")).not_to be_valid
  end

  it "has many appointments" do
    expect(jim.appointments.first).to eq(appt1)
    expect(jim.appointments.last).to eq(appt2)
  end

  it "has many users through appointments" do
    expect(jim.users.first).to eq(andrew)
    expect(jim.users.last).to eq(allyson)
  end

end
