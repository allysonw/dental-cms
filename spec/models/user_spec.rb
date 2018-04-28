require 'rails_helper'

RSpec.describe User, :type => :model do

  it "is valid with a name, email, and password" do
    user = FactoryBot.create(:user)
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
