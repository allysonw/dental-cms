require 'rails_helper'

RSpec.feature "Appointments", type: :feature do

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

  scenario "show page displays appointment's info" do
    visit appointment_path(carol_appt_andrew)
    expect(page).to have_text("07/24/2018")
  end

  scenario "redirects with message if appointment not found" do

    visit appointment_path(12345)
    expect(page).to have_text("Appointment not found")
  end

  scenario "creates a new appointment with valid attributes" do
    visit(new_appointment_path)
    select('01/03/2019', from: 'Date')
    select('13:00', from: 'Time')
    select('Operatory 1', from: 'Location')
    select('Dr. Andrew', from: 'User')
    select('Carol Jones', from: 'Patient')
    click_button('Create Appointment')
    expect(Appointment.count).to eq(1)
  end

  scenario "does not create a new appointment without all required attributes" do

  end

  scenario "redirects to appointment show page upon successful creation" do
    # visit(new_appointment_path)
    # select('01/03/2019', from: 'Date')
    # select('13:00', from: 'Time')
    # select('Operatory 1', from: 'Location')
    # select('Dr. Andrew', from: 'User')
    # select('Carol Jones', from: 'Patient')
    # click_button('Create Appointment')
    # expect(page).to have_text("Appointment successfully created!")
  end

end
