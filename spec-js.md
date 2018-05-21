# Specifications for the Rails with jQuery Assessment

Specs:
- [X] Use jQuery for implementing new requirements

- [ ] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
  * On the user dashboard, an Announcement is rendered at the top of the page with jQuery jQuery and an Active Model Serialization JSON backend. A user can sift through the current announcements by clicking the "Next" button.
  * URL: /dashboard

- [X] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
  * When clicking on the "Patients" link, the Patients index page is rendered using jQuery and an Active Model Serialization JSON backend.
  * URL: /patients

- [X] Include at least one has_many relationship in information rendered via JSON and appended to the DOM.
  * A Patient has many Users (doctors). When a Patient is rendered at /patients, all of their Users are printed to the page by the AJAX code.

- [X] Use your Rails API and a form to create a resource and render the response without a page refresh.
  * Creating a Note on an Appointment Show page renders the new Note without refreshing the page.

- [X] Translate JSON responses into js model objects.
  * On the Appointment show page, when a new Note is created, it is created as a JS model object from the Rails API JSON response.

- [ ] At least one of the js model objects must have at least one method added by your code to the prototype.
  * The Announcement JS object has a prototype method formatAnnouncement(), which concatenates the Announcement's content and created_at date and returns the formatted string.

Confirm
- [X] You have a large number of small Git commits
- [X] Your commit messages are meaningful
- [X] You made the changes in a commit that relate to the commit message
- [X] You don't include changes in a commit that aren't related to the commit message
