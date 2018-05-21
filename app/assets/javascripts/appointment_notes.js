// Note class
class Note {
  constructor(attributes) {
    this.id = attributes.id;
    this.content = attributes.content;
    this.created_at = moment(attributes.created_at).format('MMM DD, YYYY - HH:MM');
  }

  formatNoteDate(date) {
    return moment(date).format('MM/DD/YY');
  }

  static renderNotesTable(notes) {
    return Note.notesTableTemplate(notes);
  }
}

function notesSetUp() {
  bindNoteClickHandlers();
  Note.notesTableSource = $("#note-table-template").html();
  Note.notesTableTemplate = Handlebars.compile(Note.notesTableSource);
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
      
      $("#note-submit-button").blur();
      $("#note-content-field")[0].value = '';
      $("#note-content-field").blur();

      let appointment_id = $(".appointment-detail").data("id")
      // get all of the appointment's notes with ajax
      $.ajax({
          method: "GET",
          url: "/appointments/" + appointment_id + "/notes",
          dataType: "json"
      }).done (function(json) {
        console.log('got all of the notes')
        let noteDiv = $("div.notes-table-div")
        let notes = [];

        json.forEach(function(note_attributes) {
          notes.push(new Note(note_attributes));
        })

        noteTable = Note.renderNotesTable(notes);
        noteDiv.empty();
        noteDiv.append(noteTable);
      })
    })
    .error(function() {console.log("Something went wrong")});
  });
}
