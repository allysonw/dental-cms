# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements

- [ ] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
  * Show page for Treatment Plans is rendered with jQuery and ASM. The user can sift through a patient's Treatment Plans by clicking a 'Next' button on the Treatment Plan show page, with the next Treatment Plan being fetched and rendered via JQuery/AJAX.

- [ ] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
  * The Patients index page is rendered using jQuery and an Active Model Serialization JSON backend.

- [ ] Include at least one has_many relationship in information rendered via JSON and appended to the DOM.
  * A Treatment Plan has_many Treatments. When a Treatment Plan is rendered on the Treatment Plan show page via AJAX, it also renders associated Treatments.

- [ ] Use your Rails API and a form to create a resource and render the response without a page refresh.
  * Creating a Note on an Appointment Show page renders the new Note without refreshing the page.

- [ ] Translate JSON responses into js model objects.
  * On the Appointment show page, when a new Note is created, it is created as a JS model object from the Rails API JSON response.

- [ ] At least one of the js model objects must have at least one method added by your code to the prototype.
  * The Note JS object has the formatNote() method

Confirm
- [X] You have a large number of small Git commits
- [X] Your commit messages are meaningful
- [X] You made the changes in a commit that relate to the commit message
- [X] You don't include changes in a commit that aren't related to the commit message
