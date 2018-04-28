require 'rails_helper'

RSpec.describe TreatmentPlan, type: :model do
  # let!(:jim) {
  #   Patient.create(
  #     :name => "Jim Jones",
  #     :dob => Time.new(1964, 12, 24, 00, 00),
  #     :address => "Nowhere, MD",
  #     :phone_number => "415-533-4034"
  # )}
  #
  # let!(:implants) {
  #   TreatmentPlan.create(
  #     :name => "Jim Jones Treatment Plan 10/12/2017",
  #     :patient_id => jim.id
  # )}
  #
  # let!(:implant) {
  #   Treatment.create(
  #   :name => "D3442 - Titanium Implant",
  #   :location => "18",
  #   :price => 995,
  #   :complete => false,
  #   :treatment_plan_id => implants.id
  # )}

  it "is valid with a name" do
    dentures = FactoryBot.create(:treatment_plan)
    expect(dentures).to be_valid
  end

  it "is not valid without a name" do
    expect(TreatmentPlan.new).not_to be_valid
  end

  it "has many treatments" do
    dentures = FactoryBot.create(:treatment_plan_with_treatments)
    expect(dentures.treatments.size).to be > (0)
  end
end
