# Dental Office Manager

![](http://forthebadge.com/images/badges/made-with-ruby.svg)

![](https://img.shields.io/badge/Released-Apr--2018-ff69b4.svg?style=flat-square)
[![GitHub last commit](https://img.shields.io/github/last-commit/allysonw/dental-cms.svg?style=flat-square)]()

Dental Office Manager is an app that creates an easy way for dentists to manage patient health records, create treatment plans, and schedule patient appointments.

Visit the live app [here](https://dental-cms.herokuapp.com/dashboard).

![demo](https://media.giphy.com/media/9rjU0XID0jjXumbcpN/giphy.gif)

## Installation
Fork and clone this repository and run `bundle install` to install the needed gems. Migrate the db with `rake db:migrate`. From the main directory, run `thin start --ssl` and navigate to https://localhost:3000/ to launch the site.

* Ruby version: ruby-2.5.0
* Run the test suite with `rspec`

## Usage
At the home page, create an account to sign in. You can sign in or sign up with Google, Facebook, or create an account with Dental Office Manager.

In the app, you are the dentist. You can
* View your dashboard, which shows you your patients and upcoming appointments
* Browse all of the patients in the practice
* Browse all appointments and filter by doctor or patient
* View individual patients and
  * Create, view, edit, and delete appointments for the patient
  * Create, view, edit, and delete treatment plans for the patient, and add treatments to the plans

As of this writing, Dental Office Manager supports a single office. When the app is deployed, dental offices will each have their own, private domains.

Thanks for checking out the app. Also take a look at my post about [deleting associated models in ActiveRecord](https://allysonw.github.io/activerecord_associations_and_dependent_destroy).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/allysonw/dental-cms. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The project is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
