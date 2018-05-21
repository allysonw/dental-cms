// Patient class
class Patient {
  constructor(attributes) {
    this.id = attributes.id;
    this.name = attributes.name;
    this.dob =  moment(attributes.dob).format('MM/DD/YY');
    this.phone_number = attributes.phone_number;
    this.users = Patient.formatUserNames(attributes.users)
    this.url = "/patients/" + this.id
  }

  static formatUserNames(users) {
    let $users = $.unique(users.map(user => user.name))
    return $users.join(", ");
  }

  static renderPatientsTable(patients) {
    if (patients.length > 0) {
      return Patient.patientsTableTemplate(patients);
    }
    else {
      return Patient.emptyPatientsTableTemplate();
    }
  }
}

function patientsSetUp() {
  bindPatientClickHandlers();
  patientHandlebarsSetUp();
}

function patientHandlebarsSetUp() {
  Patient.patientsTableSource = $("#patients-table-template").html();
  Patient.patientsTableTemplate = Handlebars.compile(Patient.patientsTableSource);

  Patient.emptyPatientsTableSource = $("#empty-patients-table-template").html();
  Patient.emptyPatientsTableTemplate = Handlebars.compile(Patient.emptyPatientsTableSource);
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
    .done(printPatientsTable)
    .error(function() {console.log("Something went wrong")});
  });
}

function printPatientsTable(json) {
  let mainDiv = $("div.main-page-content")
  let patients = [];

  json.forEach(function(patient_attributes) {
    patients.push(new Patient(patient_attributes));
  })

  patientTable = Patient.renderPatientsTable(patients);
  mainDiv.empty();
  mainDiv.append(patientTable);
}
