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
    end
  end

  def new
    # if params[:patient_id] && !Patient.exists?(params[:patient_id])
    #   redirect_to patients_path, alert: "Patient not found."
    # elsif params[:patient_id]
    #   @appointment = Appointment.new(patient_id: params[:patient_id])
    # else
    #   @appointment = Appointment.new
    # end
  end

  def create
    # @appointment = Appointment.new(appointment_params)
    #
    # if @appointment.save
    #   flash[:success] = "Appointment successfully created!"
    #   redirect_to appointment_path(@appointment)
    # else
    #   render :new
    # end
  end

  def edit
    # if @appointment.nil?
    #   appointment_not_found
    # end
  end

  def update
    # @appointment.update(appointment_params)
    # if @appointment.save
    #   flash[:success] = "Appointment successfully updated!"
    #   redirect_to appointment_path(@appointment)
    # else
    #   render :edit
    # end
  end

  def destroy
    # if @appointment.nil?
    #   appointment_not_found
    # else
    #   @appointment.destroy
    #   flash[:success] = "Appointment successfully deleted!"
    #   redirect_to appointments_path
    #   # TODO fix to redirect to page user was on before deleting
    # end
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
