require 'rails_helper'

RSpec.describe Treatment, type: :model do

  it "is valid with a name" do
    filling = FactoryBot.create(:treatment)
    expect(filling).to be_valid
  end

  it "is not valid without a name" do
    expect(Treatment.new).not_to be_valid
  end

  it "belongs to a treatment plan" do
    filling = FactoryBot.create(:treatment)
    expect(filling.treatment_plan).to_not be_nil
  end
end
