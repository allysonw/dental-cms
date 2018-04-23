require 'rails_helper'

RSpec.describe AppointmentNote, type: :model do
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

  let(:thursday_note) {
    AppointmentNote.create(
      :content => "This is a new note."
    )
  }

  before do
    thursday.patient = jim
    thursday.user = andrew
    thursday.appointment_notes << thursday_note
    thursday.save
  end

  it "is valid with content" do
    expect(thursday_note).to be_valid
  end

  it "is not valid without content" do
    expect(AppointmentNote.create(appointment_id: thursday.id)).not_to be_valid
  end

  it "belongs to an appointment" do
    expect(thursday_note.appointment).to eq(thursday)
  end

end
