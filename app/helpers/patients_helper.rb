module PatientsHelper
  def date_of_birth(patient)
    patient.dob.strftime("%D")
  end
end
