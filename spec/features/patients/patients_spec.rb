require 'rails_helper'

RSpec.feature "Patients", type: :feature do

  before do
    Patient.destroy_all
    user = FactoryBot.create(:user)
    signin(user.email, user.password)
  end

  scenario "show page displays patient's info" do
    patient = FactoryBot.create(:patient)
    
    visit patient_path(patient)
    expect(page).to have_text("Jim")
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
    fill_in "patient_address_attributes_street_1", with: "1932 Mott Street"
    fill_in "patient_address_attributes_street_2", with: "Unit C"
    fill_in "patient_address_attributes_city", with: "New York"
    fill_in "patient_address_attributes_state", with: "NY"
    fill_in "patient_address_attributes_zip_code", with: "10030"
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
    click_button('Create Patient')

    expect(page).to have_css("div.field_with_errors")
  end

  scenario "redirects to patient show page upon successful creation" do
    visit(new_patient_path)
    fill_in "patient_name", with: "Bob Jones"
    select('2018', from: 'patient[dob(1i)]')
    select('June', from: 'patient[dob(2i)]')
    select('25', from: 'patient[dob(3i)]')
    fill_in "patient_address_attributes_street_1", with: "1932 Mott Street"
    fill_in "patient_address_attributes_street_2", with: "Unit C"
    fill_in "patient_address_attributes_city", with: "New York"
    fill_in "patient_address_attributes_state", with: "NY"
    fill_in "patient_address_attributes_zip_code", with: "10030"
    fill_in "patient_phone_number", with: "123-456-7899"
    click_button('Create Patient')

    expect(page).to have_current_path(patient_path(Patient.last))
  end

  scenario "redirects to patient show page upon successful edit" do
    patient = FactoryBot.create(:patient)

    visit(edit_patient_path(patient))
    select('1965', from: 'patient[dob(1i)]')
    click_button('Update Patient')

    expect(page).to have_text("Patient successfully updated!")
  end

  scenario "deletes a patient successfully" do
    patient = FactoryBot.create(:patient)

    visit(patient_path(patient))
    click_on(class: 'delete-patient')
    expect(Patient.count).to eq(0)
    expect(page).to have_text("Patient successfully deleted!")
  end

end
