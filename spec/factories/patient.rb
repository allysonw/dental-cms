FactoryBot.define do
  factory :patient do
    name "Carol Jones"
    dob Time.new(1964, 3, 19, 00, 00)
    address "Sandwich, AL"
    phone_number "342-433-3345"
  end
end
