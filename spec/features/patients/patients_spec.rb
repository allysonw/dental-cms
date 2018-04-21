require 'rails_helper'

RSpec.feature "Patients", type: :feature do

  let (:carol) { FactoryBot.create(:patient) }
  let (:drandrew) { FactoryBot.create(:user) }
  let (:carol_appt_andrew) { Appointment.create(
    :date => "07/24/2018",
    :time => "11:00",
    :location => "Operatory 2",
    :patient_id => carol.id,
    :user_id => drandrew.id
  )}

  before do
    signin(drandrew.email, drandrew.password)
  end

  scenario "show page displays patient's info" do
    visit patient_path(carol)
    expect(page).to have_text("Carol Jones")
  end

  scenario "redirects with message if patient not found" do
    visit patient_path(12345)
    expect(page).to have_text("Patient not found")
  end

end
