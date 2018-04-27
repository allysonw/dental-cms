module PatientsHelper
  def date_of_birth(patient)
    patient.dob.strftime("%D")
  end

  def patient_confirm_text
     "Are you sure you would like to delete this patient? This will also delete the patient's appointments, appointment notes, treatment plans, and treatments!"
  end
end
