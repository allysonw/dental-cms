require 'rails_helper'

RSpec.feature "Appointments", type: :feature do

  let (:carol) { FactoryBot.create(:patient) } # lazy evaluation!
  let (:drallyson) { FactoryBot.create(:user) }
  let (:carol_appt_allyson) { Appointment.create(
    :time => Time.new(2018, 7, 24, 11, 00),
    :location => "Operatory 2",
    :patient_id => carol.id,
    :user_id => drallyson.id
  )}

  before do
    signin(drallyson.email, drallyson.password) # drallyson gets evaluated.. carol does not
  end

  scenario "show page displays appointment's info" do
    visit appointment_path(carol_appt_allyson) # now appt is evaluated, carol is still not!
    expect(page).to have_text("2018-07-24")
  end

  scenario "redirects with message if appointment not found" do

    visit appointment_path(12345)
    expect(page).to have_text("Appointment not found")
  end

  scenario "creates a new appointment with valid attributes" do
    carol = FactoryBot.create(:patient) # have to have carol be evaluated before this test will work...

    visit(new_appointment_path)
    select('2018', from: 'appointment[time(1i)]')
    select('May', from: 'appointment[time(2i)]')
    select('21', from: 'appointment[time(3i)]')
    select('19', from: 'appointment[time(4i)]')
    select('34', from: 'appointment[time(5i)]')
    fill_in "appointment_location", with: "Operatory 1"
    select('Dr. Allyson Wesman', from: 'appointment_user_id')
    select('Carol Jones', from: 'appointment_patient_id')
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
