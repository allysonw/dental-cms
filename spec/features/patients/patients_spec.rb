require 'rails_helper'

RSpec.feature "Patients", type: :feature do

  let (:carol) { FactoryBot.create(:patient) }
  let (:drandrew) { FactoryBot.create(:user) }
  let (:carol_appt_andrew) { Appointment.create(
    :time => Time.new(2018, 7, 24, 11, 00),
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

  scenario "creates a new patient with valid attributes" do
    visit(new_patient_path)
    fill_in "patient_name", with: "Bob Jones"
    select('2018', from: 'patient[dob(1i)]')
    select('June', from: 'patient[dob(2i)]')
    select('25', from: 'patient[dob(3i)]')
    fill_in "patient_address", with: "1932 Mott Street"
    fill_in "patient_phone_number", with: "123-456-7899"

    click_button('Create Patient')

    expect(Patient.count).to eq(1)
  end

  scenario "does not create a new patient without all required attributes" do
    visit(new_patient_path)
    fill_in "patient_name", with: "Bob Jones"
    select('2018', from: 'patient[dob(1i)]')
    select('June', from: 'patient[dob(2i)]')
    select('25', from: 'patient[dob(3i)]')
    # did not fill in address
    fill_in "patient_phone_number", with: "123-456-7899"

    expect(page).to have_css("div.field_with_errors")
  end

  scenario "redirects to appointment show page upon successful creation" do
    # visit(new_patient_path)
    # select('2019', from: 'appointment[time(1i)]')
    # select('June', from: 'appointment[time(2i)]')
    # select('25', from: 'appointment[time(3i)]')
    # select('03', from: 'appointment[time(4i)]')
    # select('15', from: 'appointment[time(5i)]')
    # fill_in "appointment_location", with: "Operatory 5"
    # select('Dr. Allyson Wesman', from: 'appointment_user_id')
    # select('Carol Jones', from: 'appointment_patient_id')
    # click_button('Create Patient')
    #
    # expect(page).to have_current_path(patient_path(Patient.last))
  end

  scenario "redirects to patient show page upon successful edit" do
    # visit(edit_patient_path(patient))
    # select('2020', from: 'appointment[time(1i)]')
    # fill_in "appointment_location", with: "Operatory 56"
    # click_button('Update Patient')
    #
    # expect(page).to have_text("Patient successfully udpated!")
  end

end
