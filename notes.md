## Questions Where to start?

- install ruby
- install gems
- create models

Do I need multiple devise models?

What are things doctors can do

What are things patients can do

Do they overlap

Views for everyone
- patient profile
- appointment (only dr can change)
- medical record (only dr can change)
- treatment plan (only dr can change)

Doctor-only
List of patients
List of appointments
New appointment, edit appt
New MR, edit
New tx plan, edit
New tx, edit

Try multiple models - see what happens

1) patient
2) doctor
- later can change doctor to employee and add authorization to various roles

## Build app for doctors-eyes only first
- once that is working, add in patient login

## STEP 1: Create basic models & set up authentication for Doctor model

## STEP 2: Build out app

## STEP 3: come back LATER and add in ability for patients to log in
This means at first there are no user roles needed - only doctors ever log in
Could add some roles to user such as doctor, administrative assistant
- only doc's can edit appt notes, medical records, treatment plans, treatments
- both doc's and AA's can edit appts
Patient model is still needed
When I add in patient users, can look up their patient_id somehow...?















Users can all log in
Some users have role "doctor"
join table between these users and their patients is called????
