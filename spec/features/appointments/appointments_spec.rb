require 'rails_helper'

RSpec.feature "Appointments", type: :feature do

  let! (:carol) { FactoryBot.create(:patient) } # lazy evaluation!
  let! (:drallyson) { FactoryBot.create(:user) }
  let (:carol_appt_allyson) { Appointment.create(
    :time => Time.new(2018, 7, 24, 11, 00),
    :location => "Operatory 2",
    # :patient_id => carol.id,
    # :user_id => drallyson.id
  )}

  before do
    carol_appt_allyson.patient = carol
    carol_appt_allyson.user = drallyson
    carol_appt_allyson.save
    signin(drallyson.email, drallyson.password) # drallyson gets evaluated.. carol does not
  end

  scenario "show page displays appointment's info" do
    visit appointment_path(carol_appt_allyson) # now appt is evaluated, carol is still not!
    expect(page).to have_text("July 24")
  end

  scenario "redirects with message if appointment not found" do

    visit appointment_path(12345)
    expect(page).to have_text("Appointment not found")
  end

  scenario "creates a new appointment with valid attributes" do
    #FactoryBot.create(:patient) # have to have carol be evaluated before this test will work...

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

    expect(Appointment.count).to eq(2)
  end

  scenario "does not create a new appointment without all required attributes" do
    visit(new_appointment_path)
    select('2019', from: 'appointment[time(1i)]')
    select('June', from: 'appointment[time(2i)]')
    select('25', from: 'appointment[time(3i)]')
    select('03', from: 'appointment[time(4i)]')
    select('15', from: 'appointment[time(5i)]')
    # No location specified
    select('Dr. Allyson Wesman', from: 'appointment_user_id')
    select('Carol Jones', from: 'appointment_patient_id')
    click_button('Create Appointment')

    expect(page).to have_css("div.field_with_errors")
  end

  scenario "redirects to appointment show page upon successful creation" do
    visit(new_appointment_path)
    select('2019', from: 'appointment[time(1i)]')
    select('June', from: 'appointment[time(2i)]')
    select('25', from: 'appointment[time(3i)]')
    select('03', from: 'appointment[time(4i)]')
    select('15', from: 'appointment[time(5i)]')
    fill_in "appointment_location", with: "Operatory 5"
    select('Dr. Allyson Wesman', from: 'appointment_user_id')
    select('Carol Jones', from: 'appointment_patient_id')
    click_button('Create Appointment')

    expect(page).to have_current_path(appointment_path(Appointment.last))
  end

  scenario "redirects to appointment show page upon successful edit" do
    visit(edit_appointment_path(carol_appt_allyson))
    select('2020', from: 'appointment[time(1i)]')
    fill_in "appointment_location", with: "Operatory 56"
    click_button('Update Appointment')

    expect(page).to have_text("Appointment successfully updated!")
  end

  scenario "deletes an appointment successfully" do
    visit(appointment_path(carol_appt_allyson))
    click_on(class: 'delete-appointment')
    expect(Appointment.count).to eq(0)
    expect(page).to have_text("Appointment successfully deleted!")
  end

end
