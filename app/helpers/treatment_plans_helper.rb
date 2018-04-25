module TreatmentPlansHelper
  def treatment_plan_form_options(treatment_plan)
    if treatment_plan.persisted?
      # need to edit the treatment plan
     { url: patient_treatment_plan_path }
    else
      # it's a new treatment plan
      { url: patient_treatment_plans_path }
    end
  end
end
