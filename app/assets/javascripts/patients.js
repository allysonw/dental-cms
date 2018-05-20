// Patient class
class Patient {
  constructor(attributes) {
    this.id = attributes.id;
    this.name = attributes.name;
    this.dob =  moment(attributes.dob).format('MM/DD/YY');
    this.phone_number = attributes.phone_number;

    let $users = $.unique(attributes.users.map(user => user.name))
    this.users = $users.join(", ");

    this.url = "/patients/" + this.id
  }

  renderPatientRow() {
    return Patient.patientRowTemplate(this);
  }
}

// Set up
$(function() {
  bindClickHandlers();
  Patient.patientRowSource = $("#patient-row-template").html();
  Patient.patientRowTemplate = Handlebars.compile(Patient.patientRowSource);
});


function bindClickHandlers() {
  $("a.patient-index-link").on("click", function(e) {
    e.preventDefault();
    history.pushState(null, null, '/patients')
    $.ajax({
        method: "GET",
        url: "/patients",
        dataType: "json"
    })
    .done(function(json) {
      let mainDiv = $("div.main-page-content")
      let patientTable = "<table>";

      json.forEach(function(patient_attributes) {
        patient = new Patient(patient_attributes);
        patientRow = patient.renderPatientRow();
        patientTable += patientRow;
      })

      patientTable += "</table>";
      mainDiv.empty();
      mainDiv.append(patientTable);
    })
    .error(function() {console.log("Something went wrong")});
  });
}
