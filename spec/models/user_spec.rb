require 'rails_helper'

RSpec.describe User, :type => :model do
  # let!(:user) {
  #   User.create(
  #     :name => "Doctor Andrew",
  #     :password => "password",
  #     :email => "awesman@icloud.com"
  #   )
  # }

  # let!(:jim) {
  #   Patient.create(
  #     :name => "Jim Jones",
  #     :dob => Time.new(1967, 11, 19, 00, 00),
  #     :address => "Nowhere, MD",
  #     :phone_number => "415-533-4034"
  #   )
  # }



    # let!(:nancy) {
    #   Patient.create(
    #     :name => "Nancy Jones",
    #     :dob => Time.new(1964, 12, 24, 00, 00),
    #     :address => "Somewhere, MD",
    #     :phone_number => "415-344-4034"
    #   )
    # }

  # let! (:user) { FactoryBot.build_stubbed(:user_with_appointments) }
  # let! (:jim) { FactoryBot.build_stubbed(:patient, name: "Jim") }
  # let! (:nancy) { FactoryBot.build_stubbed(:patient, name: "Nancy") }
  #let! (:appt1) { FactoryBot.build_stubbed(:appointment, user_id: user.id) }
  #let! (:appt2) { FactoryBot.build_stubbed(:appointment, user_id: user.id) }

  # let!(:appt1) { Appointment.create(
  #   :time => Time.new(2018, 7, 24, 11, 00),
  #   :location => "Operatory 2",
  #   :patient_id => jim.id,
  #   :user_id => user.id
  # )}
  #
  # let!(:appt2) { Appointment.create(
  #   :time => Time.new(2019, 12, 24, 13, 00),
  #   :location => "Operatory 4",
  #   :patient_id => nancy.id,
  #   :user_id => user.id
  # )}

  it "is valid with a name, email, and password" do
    user = FactoryBot.build_stubbed(:user)
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

  it "has many appointments" do
    user = FactoryBot.create(:user_with_appointments)
    expect(user.appointments.size).to be > 0

  end

  it "has many patients through appointments" do
    user = FactoryBot.create(:user_with_appointments)
    expect(user.patients.size).to be > 0
  end

end
