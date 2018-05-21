module PatientsHelper
  def date_of_birth(patient)
    patient.dob.strftime("%D")
  end

  def patient_confirm_text
     "Are you sure you would like to delete this patient? This will also delete the patient's appointments, appointment notes, treatment plans, and treatments!"
  end

  def display_street_2_address(patient)
    if !patient.address.street_2.blank?
      ", " + patient.address.street_2
    end
  end

  def display_patients_list(patients)
    if patients.blank?
      "<h6>No patients have been created.</h6>".html_safe
    else
      render partial: 'patients/patients_table', locals: { patients: patients }
    end
  end

end
