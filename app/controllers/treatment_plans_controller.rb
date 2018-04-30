class TreatmentPlansController < ApplicationController
  before_action :authenticate_user!
  before_action :validate_patient_param
  before_action :set_treatment_plan, only: [:edit, :show, :update, :destroy]

  def index
    @treatment_plans = TreatmentPlan.for_patient(params[:patient_id])
    @patient = Patient.find_by(id: params[:patient_id])
  end

  def show
    if @treatment_plan.nil?
      treatment_plan_not_found
    else
      @patient = @treatment_plan.patient
      @treatments = @treatment_plan.treatments
      @treatment = Treatment.new
    end
  end

  def new
    @treatment_plan = TreatmentPlan.new(patient_id: params[:patient_id])
  end

  def create
    @treatment_plan = TreatmentPlan.new(treatment_plan_params)

    if @treatment_plan.save
      flash[:success] = "Treatment plan successfully created!"
      redirect_to patient_treatment_plan_path(@treatment_plan.patient.id, @treatment_plan)
    else
      render :new
    end
  end

  def edit
    if @treatment_plan.nil?
      treatment_plan_not_found
    end
  end

  def update
    @treatment_plan.update(treatment_plan_params)
    if @treatment_plan.save
      flash[:success] = "Treatment plan successfully updated!"
      redirect_to patient_treatment_plan_path(@treatment_plan.patient, @treatment_plan)
    else
      render :edit
    end
  end

  def destroy
    if @treatment_plan.nil?
      treatment_plan_not_found
    else
      @treatment_plan.destroy
      flash[:success] = "Treatment plan successfully deleted!"
      redirect_to patient_path(@treatment_plan.patient)
    end
  end

  private
    def treatment_plan_params
      params.require(:treatment_plan).permit(:name, :patient_id)
    end

    def set_treatment_plan
      @treatment_plan = TreatmentPlan.find_by(id: params[:id])
    end

    def treatment_plan_not_found
      flash[:alert] = "Treatment Plan not found"
      redirect_to patients_path
    end

    def validate_patient_param
      if invalid_or_no_patient_param_in_url
        redirect_to patients_path, alert: "Patient not found."
      end
    end

    def invalid_or_no_patient_param_in_url
      # returns true if patient= is not in the URL, or if the patient doesn't exist
      # TODO move this logic to routes.rb so no top-level treatment_plan urls exist
      (params[:patient_id] && !Patient.exists?(params[:patient_id])) || params[:patient_id].blank?
    end

end
