## Where to start?

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
- List of patients
- List of appointments
- New appointment, edit appt
- New MR, edit
- New tx plan, edit
- New tx, edit

1) patient
2) doctor
- later can change doctor to employee and add authorization to various roles

## Build app for doctors-eyes only first
- once that is working, add in patient login

## STEP 1: Create basic models & set up authentication for User model
DONE

## STEP 2: Build out app

## Implement omniauth for google
DONE

## Implement omniauth for facebook
DONE

## Create CRU for patients and appointments
DONE

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
- [ ] redirect user back to page they were on during deletion of resources
- [ ] watch rest of TODOmvc vids
- [X] build address model
- [X] nested form for creation of address at same time as patient
- [ ] build identities table and refactor authentication
- [ ] Blog post
- [ ] README
- [ ] Create Giphy for demo video

## DONE:
Set up simple custom CSS template[DONE]
Fix bug where you can't delete appts[DONE]
Fix patient show page to show button when no tx plans or appts[DONE]
Fix flash messages[DONE]

## AFTER GRADUATION
### POLISH AND ADD SMALL FEATURES
- Treatments - still need to build edit
- Phone number Validations
- Create location model and populate with defaults

### Add filters to patients page
- patients with appts today
- patients with appts in next week

### Build date-based filters for appointments

### Implenent calendar date selectors for appointments

### DEPLOY
- Deploy to heroku

## Ability for patients to log in
Patient model is still needed
When I add in patient users, can look up their patient_id somehow...?

## Add roles to user such as doctor, administrative assistant
- only doc's can edit appt notes, medical records, treatment plans, treatments
- both doc's and AA's can edit appts

## Devise Methods

* before_action :authenticate_user!           Set up a controller with user authentication:
* user_signed_in?                             Verify a user is signed in
* current_user                                Get current signed-in user

* Override after_sign_in_path_for and after_sign_out_path_for to customize your redirect hooks.
