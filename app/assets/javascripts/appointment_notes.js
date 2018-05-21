// Note class
class Note {
  constructor(attributes) {
    this.id = attributes.id;
    this.content = attribtes.content;
    this.created_at = attributes.created_at;
  }

  formatNoteDate(date) {
    return moment(date).format('MM/DD/YY');
  }

  static renderNotesTable(patients) {
    return Patient.patientTableTemplate(patients);
  }
}

function notesSetUp() {
  bindNoteClickHandlers();
  Note.noteTableSource = $("#note-table-template").html();
  Note.noteTableTemplate = Handlebars.compile(Note.noteTableSource);
}

function bindNoteClickHandlers() {
  $("form.new_appointment_note").on("submit", function(e) {
    e.preventDefault();
    let $form = $(this);
    let action = $form.attr("action");
    let params = $form.serialize();

    $.ajax({
        method: "POST",
        url: action,
        data: params,
        dataType: "json"
    })
    .done(function(json) {
      let noteDiv = $("div.notes-table-div")
      let notes = [];


      // get all of the appointments notes with ajax
      $.ajax({
          method: "GET",
          url: "/appointments/:appointment_id/notes",
          dataType: "json"
      })

      json.forEach(function(note_attributes) {
        notes.push(new Note(note_attributes));
      })

      noteTable = Note.renderNoteTable(notes);
      noteDiv.empty();
      ntoeDiv.append(noteTable);
    })
    .error(function() {console.log("Something went wrong")});
  });
}
