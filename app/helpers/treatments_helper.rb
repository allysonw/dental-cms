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

  def tooth_numbers
    locations = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16']
    locations.concat(['17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32'])
    locations.concat(['UR', 'LR', 'UL', 'LL', 'UA', 'LA'])
  end
end
