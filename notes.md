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

## STEP 1: Create basic models & set up authentication for User model
DONE

## STEP 2: Build out app
# Implement omniauth for google
DONE

# Implement omniauth for facebook
DONE

# Create CRU for patients and appointments
In progress - created Show, Index, New, Create, update

# Do some work on styling with bootstrap
- get homepage, login/signup pages, and user dash in good shape[DONE]
- figure out where to put new, delete, and edit buttons[DONE]
- Create destroy action[DONE]

# Create ability to add new appt from patient page
DONE

# create model class method for appts
[DONE]

# build out additional models related to patient class
treatment_plan - DONE


# Before turning in:
1) watch rest of TODOmvc vids
2) nested form for creation of address at same time as patient
3) build identities table and refactor authentication
4) Set up simple custom CSS template
5) fix bug where you can't delete appts
- write tests for deletion for all models
5) Blog post


After graduation
treatments - still need to build edit

# add filters to patients page
- patients with appts today
- patients with appts in next week

# build date-based filters for appointments

# deploy to heroku

## STEP 3: come back LATER and add in ability for patients to log in
This means at first there are no user roles needed - only doctors ever log in
Could add some roles to user such as doctor, administrative assistant
- only doc's can edit appt notes, medical records, treatment plans, treatments
- both doc's and AA's can edit appts
Patient model is still needed
When I add in patient users, can look up their patient_id somehow...?


## Devise Methods

* before_action :authenticate_user!           Set up a controller with user authentication:
* user_signed_in?                             Verify a user is signed in
* current_user                                Get current signed-in user

* Override after_sign_in_path_for and after_sign_out_path_for to customize your redirect hooks.
