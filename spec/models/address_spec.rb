require 'rails_helper'

RSpec.describe Address, type: :model do
  let(:address) { FactoryBot.build_stubbed(:address) }

  it "is valid with street_1, street_2, city, state, and zip_code" do
    expect(address).to be_valid
  end

  it "is not valid without street_1" do
    address.street_1 = nil
    expect(address).not_to be_valid
  end

  it "is valid without street_2" do
    address.street_2 = nil
    expect(address).to be_valid
  end

  it "belongs to a patient" do
    expect(address.patient).to_not be_nil
  end
end
