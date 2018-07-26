// Patient class
class Patient {
  constructor(attributes) {
    this.id = attributes.id;
    this.name = attributes.name;
    this.dob =  moment(attributes.dob).format('MM/DD/YY');
    this.phoneNumber = attributes.phone_number;
    this.users = Patient.formatUserNames(attributes.users)

    // set a URL attribute to use in the Handlebars template
    this.url = "/patients/" + this.id
  }

  // Class method to format the users belonging to a patient.
  // Called in the constructor so written as a class method
  // rather than a prototype method. Returns a patient's
  // users as a string.
  static formatUserNames(users) {
    let $users = $.unique(users.map(user => user.name))
    return $users.join(", ");
  }

  // Use Handlebars template to render DOM elements
  // Pass in patients, an array of Patient objects
  static renderPatientsTable(patients) {
    if (patients.length > 0) {
      return Patient.patientsTableTemplate(patients);
    }
    else {
      // If there are no patients in the system, we don't want to
      // render the <table> HTML found in the patientsTableTemplate
      // HB template. The  emptyPatientsTableTemplate contains verbiage
      // about how there are no patients.
      return Patient.emptyPatientsTableTemplate();
    }
  }
}

// Set up to load the first announcement on page load
// Called from base.js on document.ready
function patientsSetUp() {
  patientHandlebarsSetUp();
  bindPatientClickHandlers();
}

// Create Handlebars templates for the Patients div
function patientHandlebarsSetUp() {
  Patient.patientsTableSource = $("#patients-table-template").html();
  Patient.patientsTableTemplate = Handlebars.compile(Patient.patientsTableSource);

  Patient.emptyPatientsTableSource = $("#empty-patients-table-template").html();
  Patient.emptyPatientsTableTemplate = Handlebars.compile(Patient.emptyPatientsTableSource);
}

// Set up a handler for the click event on the "Patients" link
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

// Build new patients from the response to the GET /patients
// request, render an array of patients with Handlebars, and
// use it to inject the patient table into the DOM
function printPatientsTable(json) {
  const mainDiv = $("div.main-page-content")
  const patients = [];

  // json is an array JSON objects representing patients
  json.forEach(function(patientAttributes) {
    patients.push(new Patient(patientAttributes));
  })

  patientTable = Patient.renderPatientsTable(patients);
  mainDiv.empty();
  mainDiv.append(patientTable);
}
