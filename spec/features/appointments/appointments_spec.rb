require 'rails_helper'

RSpec.feature "Appointments", type: :feature do

  before do
    Appointment.destroy_all
    user = FactoryBot.create(:user)
    patient = FactoryBot.create(:patient)

    signin(user.email, user.password)
  end

  scenario "show page displays appointment's info" do
    appointment = FactoryBot.create(:appointment)
    visit appointment_path(appointment)
    expect(page).to have_text("November 19")
  end

  scenario "redirects with message if appointment not found" do
    visit appointment_path(12345)
    expect(page).to have_text("Appointment not found")
  end

  # scenario "creates a new appointment with valid attributes" do
  #   visit(new_appointment_path)
  #
  #   select('2018', from: 'appointment[time(1i)]')
  #   select('May', from: 'appointment[time(2i)]')
  #   select('10', from: 'appointment[time(3i)]')
  #   select('10', from: 'appointment[time(4i)]')
  #   select('30', from: 'appointment[time(5i)]')
  #   fill_in "appointment_location", with: "Operatory 1"
  #   select('Allyson', from: 'appointment_user_id')
  #   select('Jim', from: 'appointment_patient_id')
  #   click_button('Create Appointment')
  #
  #   expect(Appointment.count).to eq(1)
  # end
  #
  # scenario "does not create a new appointment without all required attributes" do
  #   visit(new_appointment_path)
  #   select('2019', from: 'appointment[time(1i)]')
  #   select('June', from: 'appointment[time(2i)]')
  #   select('25', from: 'appointment[time(3i)]')
  #   select('10', from: 'appointment[time(4i)]')
  #   select('15', from: 'appointment[time(5i)]')
  #   # No location specified
  #   select('Allyson', from: 'appointment_user_id')
  #   select('Jim', from: 'appointment_patient_id')
  #   click_button('Create Appointment')
  #
  #   expect(page).to have_css("div.field_with_errors")
  # end
  #
  # scenario "redirects to appointment show page upon successful creation" do
  #   visit(new_appointment_path)
  #   select('2019', from: 'appointment[time(1i)]')
  #   select('June', from: 'appointment[time(2i)]')
  #   select('25', from: 'appointment[time(3i)]')
  #   select('10', from: 'appointment[time(4i)]')
  #   select('15', from: 'appointment[time(5i)]')
  #   fill_in "appointment_location", with: "Operatory 5"
  #   select('Allyson', from: 'appointment_user_id')
  #   select('Jim', from: 'appointment_patient_id')
  #   click_button('Create Appointment')
  #
  #   expect(page).to have_current_path(appointment_path(Appointment.last))
  # end
  #
  # scenario "redirects to appointment show page upon successful edit" do
  #   appointment = FactoryBot.create(:appointment)
  #
  #   visit(edit_appointment_path(appointment))
  #   select('2020', from: 'appointment[time(1i)]')
  #   fill_in "appointment_location", with: "Operatory 56"
  #   click_button('Update Appointment')
  #
  #   expect(page).to have_text("Appointment successfully updated!")
  # end

  scenario "deletes an appointment successfully" do
    appointment = FactoryBot.create(:appointment)

    visit(appointment_path(appointment))
    click_on(class: 'delete-appointment')
    expect(Appointment.count).to eq(0)
    expect(page).to have_text("Appointment successfully deleted!")
  end

end
