module TreatmentsHelper
  def complete?(treatment)
    treatment.complete ? "Yes" : "No"
    # TODO add a date_completed field to treatment table and return date completed if treatment is complete
  end
end
