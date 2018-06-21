// Note class
class Note {
  constructor(attributes) {
    this.id = attributes.id;
    this.content = attributes.content;
    this.createdAt = moment(attributes.createdAt).format('MMM DD, YYYY - h:mm A');
  }
}

// Set up to load the first announcement on page load
// Called from base.js on document.ready
function notesSetUp() {
  bindNoteClickHandlers();

  // Handlebars set up
  Note.notesTableSource = $("#note-table-template").html();
  Note.notesTableTemplate = Handlebars.compile(Note.notesTableSource);
}

// Set up a handler for the submit event on the
// new note form
function bindNoteClickHandlers() {
  $("form.new_appointment_note").on("submit", submitNoteForm);
}

// POST a request to the backend to create a new note
function submitNoteForm (e) {
  e.preventDefault();
  let $form = $(this);
  const action = $form.attr("action");
  const params = $form.serialize();

  $.ajax({
      method: "POST",
      url: action,
      data: params,
      dataType: "json"
  })
  // once the post goes through, we need to display the full table
  // of all notes for this appointment including the new note that
  // was just crated
  .done(getAppointmentNotes)
  .error(() => console.log("Something went wrong with creating the note."));
}

//
function getAppointmentNotes() {
  // re-enable the submit form after a submission
  $("#note-submit-button").blur();
  $("#note-content-field")[0].value = '';
  $("#note-content-field").blur();

  let appointmentId = $(".appointment-detail").data("id")

  // get all of the notes for the appointment
  $.ajax({
      method: "GET",
      url: "/appointments/" + appointmentId + "/notes",
      dataType: "json"
  })
  .done(printNotesTable)
  .error(() => console.log("Something went wrong with getting notes for this appointment."));
}

// Build new notes from the response to the GET /appointments/:id/notes
// request, render an array of notes with Handlebars, and
// use it to inject the patient table into the DOM
function printNotesTable(json) {
  let noteDiv = $("div.notes-table-div")
  let notes = [];
  
  json.forEach(function(noteAttributes) {
    notes.push(new Note(noteAttributes));
  })

  noteTable = Note.notesTableTemplate(notes);
  noteDiv.empty();
  noteDiv.append(noteTable);
}
