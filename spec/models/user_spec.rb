require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) {
    User.create(
      :name => "Doctor Andrew",
      :password => "password",
      :email => "awesman@icloud.com"
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

  let(:nancy) {
    Patient.create(
      :name => "Nancy Jones",
      :dob => "12/15/1957",
      :address => "Somewhere, MD",
      :phone_number => "415-344-4034"
    )
  }

  it "is valid with a name, email, and password" do
    expect(user).to be_valid
  end

  it "is not valid without a password" do
    expect(User.new(name: "Name", email: "email@email.com")).not_to be_valid
  end

  it "is not valid without an email" do
    expect(User.new(name: "Name", password: "password")).not_to be_valid
  end

  it "is not valid without a name" do
    expect(User.new(email: "email@email.com", password: "password")).not_to be_valid
  end

  it "has many user_patients" do
    first_patient = UserPatient.create(:user_id => user.id, :patient_id => jim.id)
    second_patient = UserPatient.create(:user_id => user.id, :patient_id => nancy.id)
    expect(user.user_patients.first).to eq(first_patient)
    expect(user.user_patients.last).to eq(second_patient)
  end

  it "has many patients through user_patients" do
    user.patients << [jim, nancy]
    expect(user.patients.first).to eq(jim)
    expect(user.patients.last).to eq(nancy)
  end

end
