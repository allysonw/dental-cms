class TreatmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_treatment, only: [:edit, :update, :destroy, :complete]

  def create
    @treatment_plan = TreatmentPlan.find_by(id: treatment_params[:treatment_plan_id])
    @treatment = Treatment.new(treatment_params)

    if @treatment.save && @treatment_plan
      flash[:success] = "Treatment successfully created!"
      return_to_treatment_plan
    elsif @treatment_plan
      render "treatment_plans/show"
    else
      redirect_to treatment_plans_path, alert: "Something went wrong..."
    end
  end

  # def edit
  #   if @treatment_plan.nil?
  #     treatment_plan_not_found
  #   end
  # end
  #
  # def update
  #   @treatment_plan.update(treatment_plan_params)
  #   if @treatment_plan.save
  #     flash[:success] = "Treatment plan successfully updated!"
  #     redirect_to patient_treatment_plan_path(@treatment_plan.patient, @treatment_plan)
  #   else
  #     render :edit
  #   end
  # end

  def complete
    if @treatment.nil?
      treatment_not_found
    else
      @treatment.complete = true
      if @treatment.save
        flash[:success] = "Treatment successfully completed!"
      else
        flash[:alert] = "Unable to complete treatment."
      end
      return_to_treatment_plan
    end
  end

  def destroy
    if @treatment.nil?
      treatment_not_found
    else
      @treatment.destroy
      flash[:success] = "Treatment successfully deleted!"
      return_to_treatment_plan
    end
  end

  private
    def treatment_params
      params.require(:treatment).permit(:name, :price, :location, :complete, :treatment_plan_id)
    end

    def set_treatment
      @treatment = Treatment.find_by(id: params[:id])
    end

    def treatment_not_found
      flash[:alert] = "Treatment not found"
      redirect_to patients_path
    end

    def return_to_treatment_plan
      @treatment_plan = @treatment.treatment_plan
      @patient = @treatment_plan.patient

      redirect_to patient_treatment_plan_path(@patient, @treatment_plan)
    end
end
