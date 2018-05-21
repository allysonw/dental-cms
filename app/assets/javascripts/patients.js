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

  static renderPatientsTable(patients) {
    return Patient.patientsTableTemplate(patients);
  }
}

function patientsSetUp() {
  bindPatientClickHandlers();
  Patient.patientsTableSource = $("#patient-table-template").html();
  Patient.patientsTableTemplate = Handlebars.compile(Patient.patientsTableSource);
}

function bindPatientClickHandlers() {
  $("a.patient-index-link").on("click", function(e) {
    e.preventDefault();
    //history.pushState(null, null, '/patients')
    $.ajax({
        method: "GET",
        url: "/patients",
        dataType: "json"
    })
    .done(function(json) {
      let mainDiv = $("div.main-page-content")
      let patients = [];

      json.forEach(function(patient_attributes) {
        patients.push(new Patient(patient_attributes));
      })

      patientTable = Patient.renderPatientsTable(patients);
      mainDiv.empty();
      mainDiv.append(patientTable);
    })
    .error(function() {console.log("Something went wrong")});
  });
}
