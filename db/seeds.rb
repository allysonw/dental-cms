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
  :dob => "12/15/1967",
  :address => "Nowhere, MD",
  :phone_number => "415-533-4034"
)

carol = Patient.create(
  :name => "Carol Jones",
  :dob => "12/15/1943",
  :address => "Sandwich, AL",
  :phone_number => "342-433-3345"
)

carol_appt_andrew = Appointment.create(
  :date => "07/24/2018",
  :time => "11:00",
  :location => "Operatory 2",
  :patient_id => carol.id,
  :user_id => drandrew.id
)

carol_appt_allyson = Appointment.create(
  :date => "07/26/2018",
  :time => "14:00",
  :location => "Operatory 7",
  :patient_id => carol.id,
  :user_id => drallyson.id
)

carol_appt_andrew2 = Appointment.create(
  :date => "07/28/2018",
  :time => "08:00",
  :location => "Operatory 2",
  :patient_id => carol.id,
  :user_id => drandrew.id
)

jim_appt1 = Appointment.create(
  :date => "04/18/2018",
  :time => "08:00",
  :location => "Operatory 1",
  :patient_id => jim.id,
  :user_id => drandrew.id
)

jim_appt2 = Appointment.create(
  :date => "05/01/2018",
  :time => "13:00",
  :location => "Operatory 8",
  :patient_id => jim.id,
  :user_id => drandrew.id
)
