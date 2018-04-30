module TreatmentsHelper
  def complete?(treatment)
    treatment.complete ? "Yes" : "No"
    # TODO add a date_completed field to treatment table and return date completed if treatment is complete
  end

  def display_treatments_list(treatment_plan, treatments)
    if treatments.blank?
      "<h6>No treatments have been added.</h6>".html_safe
    else
       render partial: "treatments/treatments_table", locals: { treatment_plan: treatment_plan, treatments: treatments }
    end
  end
end
