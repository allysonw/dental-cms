class TreatmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_treatment, only: [:edit, :update, :destroy]

  def create
    @treatment_plan = TreatmentPlan.find_by(id: treatment_params[:treatment_plan_id])
    @treatment = Treatment.new(treatment_params)

    if @treatment.save && @treatment_plan
      flash[:success] = "Treatment successfully created!"
      redirect_to treatment_plan_path(@treatment_plan)
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
  #
  # def destroy
  #   if @treatment_plan.nil?
  #     treatment_plan_not_found
  #   else
  #     @treatment_plan.destroy
  #     flash[:success] = "Treatment plan successfully deleted!"
  #     redirect_to patient_path(@treatment_plan.patient)
  #   end
  # end

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
end
