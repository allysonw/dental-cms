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

  def treatment_plan_confirm_text
     "Are you sure you would like to delete this treatment plan? This will also delete the associated treatments!"
  end

  def display_treatment_plans_list(treatment_plans)
    if treatment_plans.blank?
      "<h6>No treatment plans have been created.</h6>".html_safe
    else
      render partial: 'treatment_plans/treatment_plans_table', locals: { treatment_plans: treatment_plans }
    end
  end
end
