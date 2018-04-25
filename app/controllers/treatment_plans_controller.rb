class TreatmentPlansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_treatment_plan, only: [:edit, :show, :update, :destroy]

  def index
    if params[:patient_id] && !Patient.exists?(params[:patient_id])
      redirect_to patients_path, alert: "Patient not found."
    elsif params[:patient_id]
      @treatment_plans = TreatmentPlan.for_patient(params[:patient_id])
      @patient = Patient.find_by(id: params[:patient_id])
    end

  end

  def show
    if @treatment_plan.nil?
      treatment_plan_not_found
    elsif params[:patient_id].blank? || (params[:patient_id] && !Patient.exists?(params[:patient_id]))
      redirect_to patients_path, alert: "Patient not found."
    else
      @patient = @treatment_plan.patient
      @treatments = @treatment_plan.treatments
      @total_cost = @treatment_plan.total_cost
      @treatment = Treatment.new
    end
  end

  def new
    if params[:patient_id] && !Patient.exists?(params[:patient_id])
      redirect_to patients_path, alert: "Patient not found."
    elsif params[:patient_id]
      @treatment_plan = TreatmentPlan.new(patient_id: params[:patient_id])
    else
      @treatment_plan = TreatmentPlan.new
    end
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
end
