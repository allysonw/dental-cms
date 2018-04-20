require 'rails_helper'

RSpec.feature "Patients", type: :feature do

  before do
    Patient.destroy_all
    User.destroy_all
    Appointment.destroy_all

    carol = Patient.create(
      :name => "Carol Jones",
      :dob => "12/15/1943",
      :address => "Sandwich, AL",
      :phone_number => "342-433-3345"
    )

    drandrew = User.create(
      :name => "Doctor Andrew",
      :password => "password",
      :email => "awesman@icloud.com"
    )

    carol_appt_andrew = Appointment.create(
      :date => "07/24/2018",
      :time => "11:00",
      :location => "Operatory 2",
      :patient_id => carol.id,
      :user_id => drandrew.id
    )
  end

  scenario "show page displays patient's info" do
    carol = Patient.find_by(name: "Carol Jones")
    visit patient_path(carol)
    expect(page).to have_text("Carol Jones")
  end

  scenario "redirects with message if patient not found" do
    visit patient_path(12345)
    expect(page).to have_text("Patient not found")
  end

end
