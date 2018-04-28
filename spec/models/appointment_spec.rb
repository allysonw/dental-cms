require 'rails_helper'

RSpec.describe Appointment, type: :model do
  let(:appointment) { FactoryBot.create(:appointment) }

  it "is valid with a date, time, and location" do
    expect(appointment).to be_valid
  end

  it "is not valid without a location" do
    expect(Appointment.new(:time => Time.new(2018, 1, 15, 14, 00))).not_to be_valid
  end

  it "belongs to a user" do
    expect(appointment.user).not_to be_nil
  end

  it "belongs to a patient" do
    expect(appointment.patient).not_to be_nil
  end

  it "can be deleted" do
    appointment.destroy
    expect(Appointment.all.size).to eq(0)
  end
end
