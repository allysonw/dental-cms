require 'rails_helper'

RSpec.describe Patient, :type => :model do
  let(:andrew) {
    User.create(
      :name => "Doctor Andrew",
      :password => "password",
      :email => "awesman@icloud.com"
    )
  }

  let(:allyson) {
    User.create(
      :name => "Doctor Allyson",
      :password => "password",
      :email => "allysonwesman@icloud.com"
    )
  }

  let(:jim) {
    Patient.create(
      :name => "Jim Jones",
      :dob => "12/15/1967",
      :address => "Nowhere, MD",
      :phone_number => "415-533-4034"
    )
  }

  it "is valid with a name, dob, address, and phone_number" do
    expect(jim).to be_valid
  end

  it "is not valid without a name" do
    expect(Patient.new(:dob => "12/15/1967", :address => "Nowhere, MD", :phone_number => "415-533-4034")).not_to be_valid
  end

  it "has many appointments" do
    first_appointment = Appointment.create(:user_id => andrew.id, :patient_id => jim.id, :date => "05/12/2018", :time => "14:00", :location => "Room 4")
    second_appointment = Appointment.create(:user_id => allyson.id, :patient_id => jim.id, :date => "04/03/2018", :time => "11:00", :location => "Room 5")
    expect(jim.appointments.first).to eq(first_appointment)
    expect(jim.appointments.last).to eq(second_appointment)
  end

  it "has many users through appointments" do
    jim.users << [allyson, andrew]
    expect(jim.users.first).to eq(allyson)
    expect(jim.users.last).to eq(andrew)
  end

end
