 FactoryBot.define do
  factory :user do
    # confirmed_at Time.now
    name "Allyson"
    sequence(:email) { |n| "#{n}@example.com" }
    password "please123"

    factory :user_with_appointments do
      after(:create) do |user|
        create_list :appointment, 3, user: user
      end
    end
  end

  factory :patient do
    name "Jim"
    dob Time.new(1964, 12, 24, 0, 0)
    phone_number "415-344-4034"

    factory :patient_with_treatment_plans do
      after(:create) do |patient|
        create_list :treatment_plan, 3, patient: patient
      end
    end
  end

  factory :treatment_plan do
    name "Dentures"
    patient

    factory :treatment_plan_with_treatments do
      after(:create) do |treatment_plan|
        create_list :treatment, 3, treatment_plan: treatment_plan
      end
    end
  end

  factory :treatment do
    name "MO Amalgam"
    location 3
    price 125
    complete false
    treatment_plan
  end

  factory :appointment do
    time Time.new(2018, 11, 19, 8, 30)
    location "Operatory 9"
    patient
    user
  end



  factory :appointment_note do
    content "This appointment went well."
    appointment
  end

  factory :address do
    street_1 "23 Jump Street"
    street_2 "Unit D"
    city "Santa Monica"
    state "CA"
    zip_code "90404"
    patient
  end
end
