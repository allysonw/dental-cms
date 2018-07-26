// Appointment class
class Appointment {
  constructor(attributes) {
    this.time = attributes.time;
    this.location = attributes.location;
    this.userId = attributes.userId;
    this.patientId = attributes.patientId;
  }
}

// Set up to load the first announcement on page load
// Called from base.js on document.ready
function appointmentsSetUp() {
  console.log("appt")
  $("#datetime").datepicker()
  bindAppointmentClickHandlers();

  // Handlebars set up
  //Note.notesTableSource = $("#note-table-template").html();
  //Note.notesTableTemplate = Handlebars.compile(Note.notesTableSource);
}

// Set up a handler for the submit event on the
// new note form
function bindAppointmentClickHandlers() {
  $("form.new_appointment").on("submit", submitAppointmentForm);
}

// POST a request to the backend to create a new appointment
function submitAppointmentForm (e) {
  e.preventDefault();
  let $form = $(this);
  const action = $form.attr("action");
  const params = $form.serialize();

  console.log(params);

  // $.ajax({
  //     method: "POST",
  //     url: action,
  //     data: params,
  //     dataType: "json"
  // })
  // .done(() => console.log("Created appointment"))
  // .error(() => console.log("Something went wrong with creating the note."));
}
