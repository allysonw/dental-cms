require 'rails_helper'

RSpec.describe TreatmentPlan, type: :model do

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
