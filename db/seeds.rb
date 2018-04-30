# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

drandrew = User.create(
  :name => "Doctor Andrew",
  :password => "password",
  :email => "awesman@icloud.com"
)

drallyson = User.create(
  :name => "Doctor Allyson",
  :password => "password",
  :email => "allysonwesman@icloud.com"
)

jim = Patient.create(
  :name => "Jim Jones",
  :dob => Time.new(1954, 10, 12, 00, 00),
  :phone_number => "415-533-4034"
)

address2 = Address.create(
  :street_1 => "309 Miracle Street",
  :city => "Santa Monica",
  :state => "CA",
  :zip_code => "90404",
  :patient_id => jim.id
)

carol = Patient.create(
  :name => "Carol Jones",
  :dob => Time.new(1977, 11, 13, 00, 00),
  :phone_number => "342-433-3345"
)

address1 = Address.create(
  :street_1 => "23 Jump Street",
  :street_2 => "Unit D",
  :city => "Santa Monica",
  :state => "CA",
  :zip_code => "90404",
  :patient_id => carol.id
)

carol_appt_andrew = Appointment.create(
  :time => Time.new(2018, 7, 24, 11, 00),
  :location => "Operatory 2",
  :patient_id => carol.id,
  :user_id => drandrew.id
)

carol_appt_allyson = Appointment.create(
  :time => Time.new(2018, 9, 24, 14, 00),
  :location => "Operatory 7",
  :patient_id => carol.id,
  :user_id => drallyson.id
)

carol_appt_andrew2 = Appointment.create(
  :time => Time.new(2018, 6, 14, 8, 00),
  :location => "Operatory 2",
  :patient_id => carol.id,
  :user_id => drandrew.id
)

jim_appt1 = Appointment.create(
  :time => Time.new(2018, 4, 18, 10, 30),
  :location => "Operatory 1",
  :patient_id => jim.id,
  :user_id => drandrew.id
)

jim_appt2 = Appointment.create(
  :time => Time.new(2019, 5, 1, 16, 15),
  :location => "Operatory 8",
  :patient_id => jim.id,
  :user_id => drandrew.id
)
