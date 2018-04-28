require 'rails_helper'

RSpec.describe AppointmentNote, type: :model do
  let(:note) { FactoryBot.create(:appointment_note) }

  it "is valid with content" do
    expect(note).to be_valid
  end

  it "is not valid without content" do
    expect(AppointmentNote.create(appointment_id: 1)).not_to be_valid
  end

  it "belongs to an appointment" do
    expect(note.appointment).to_not be_nil
  end
end
