class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient, only: [:edit, :show, :update, :destroy]

  def index
    @patients = Patient.all

    respond_to do |f|
      f.html { render :index}
      f.json { render json: @patients, status: 200 }
    end
  end

  def show
    if @patient.nil?
      patient_not_found
    else
      @appointments = @patient.appointments
      @treatment_plans = @patient.treatment_plans
    end
  end

  def new
    @patient = Patient.new
    @patient.build_address
  end

  def create
    @patient = Patient.new(patient_params)

    if @patient.save
      flash[:success] = "Patient successfully created!"
      redirect_to patient_path(@patient)
    else
      flash[:notice] = "Please fill out all fields."
      render :new
    end
  end

  def edit
    if @patient.nil?
      patient_not_found
    end
  end

  def update
    @patient.update(patient_params)
    if @patient.save
      flash[:success] = "Patient successfully updated!"
      redirect_to patient_path(@patient)
    else
      render :edit
    end
  end

  def destroy
    if @patient.nil?
      patient_not_found
    else
      @patient.destroy
      flash[:success] = "Patient successfully deleted!"
      redirect_to patients_path
    end
  end

  private
    def patient_params
      params.require(:patient).permit(:name, :dob, :phone_number, address_attributes: [:street_1, :street_2, :city, :state, :zip_code])
    end

    def set_patient
      @patient = Patient.find_by(id: params[:id])
    end

    def patient_not_found
      flash[:alert] = "Patient not found"
      redirect_to patients_path
    end
end
