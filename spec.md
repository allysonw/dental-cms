# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project

- [X] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
  * User has many appointments
  * Patient has many appointments

- [X] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
  * Appointment belongs to a user
  * Appointment belongs to a patient

- [X] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
  * User has many patients through appointments
  * Patient has many users through appointments

- [X] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
  * The appointments table includes 3 user submittable attributes: date, time, and location

- [X] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
  * User -validates :name, presence: true
      - Devise validates the presence of the email and password
  * Patient - validates :name, :dob, :address, :phone_number, presence: true
  * Appointment - validates :time, :location, :user_id, :patient_id, presence: true
  * Validations also in views by marking fields required

- [X] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
  * Appointments.for_user URL: /appointments

- [X] Include signup (how e.g. Devise)
  * Devise

- [X] Include login (how e.g. Devise)

  * Devise
- [X] Include logout (how e.g. Devise)

  * Devise
- [X] Include third party signup/login (how e.g. Devise/OmniAuth)
  * Devise/Omniauth

- [X] Include nested resource show or index (URL e.g. users/2/recipes)
  * patients/1/treatment_plans

- [X] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
  * patients/1/treatment_plans/new

- [X] Include form display of validation errors (form URL e.g. /recipes/new)
  * /patients/new

Confirm:
- [X] The application is pretty DRY
- [X] Limited logic in controllers
- [X] Views use helper methods if appropriate
- [X] Views use partials if appropriate
