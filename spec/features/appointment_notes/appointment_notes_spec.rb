require 'rails_helper'

RSpec.feature "Appointment_Notes", type: :feature do

  let! (:carol) { FactoryBot.create(:patient) }
  let! (:drallyson) { FactoryBot.create(:user) }

  let! (:carol_appt_allyson) { Appointment.create(
    :time => Time.new(2018, 7, 24, 11, 00),
    :location => "Operatory 2",
  )}

  let!(:thursday_note) {
    AppointmentNote.create(
      :content => "This is a new note.",
      :appointment_id => carol_appt_allyson.id
  )}

  before do
    carol_appt_allyson.patient = carol
    carol_appt_allyson.user = drallyson
    carol_appt_allyson.save

    signin(drallyson.email, drallyson.password)
  end

  scenario "show page displays appointment note content" do
    visit appointment_path(carol_appt_allyson)
    binding.pry
    expect(page).to have_text(thursday_note.content)
  end

  scenario "creates a new appointment note with valid attributes" do
    visit(appointment_path(carol_appt_allyson))
    fill_in "appointment_note_content", with: "Note content goes here"
    click_button('Create Note')
    expect(carol_appt_allyson.appointment_notes.count).to eq(2)
  end

  scenario "does not create a new appointment note without content" do
    visit(appointment_path(carol_appt_allyson))
    click_button('Create Note')
    expect(page).to have_css("div.field_with_errors")
  end

  scenario "redirects to appointment show page upon successful creation of note" do
    click_button('Create Note')
    expect(page).to have_current_path(appointment_path(Appointment.last))
  end
end
