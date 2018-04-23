class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient, only: [:edit, :show, :update, :destroy]

  def index
    if params[:user_id]
      @patients = User.find(params[:user_id]).patients.uniq
    else
      @patients = Patient.all
    end
  end

  def show
    if @patient.nil?
      flash[:notice] = "Patient not found"
      redirect_to patients_path
    else
      @appointments = @patient.appointments
    end
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)

    if @patient.save
      flash[:message] = "Patient successfully created!"
      redirect_to patient_path(@patient)
    else
      render :new
    end
  end

  def edit

  end

  def update
    @patient.update(patient_params)
    if @patient.save
      flash[:message] = "Patient successfully udpated!"
      redirect_to patient_path(@patient)
    else
      render :edit
    end
  end

  def destroy
    @patient.destroy
    redirect_to patients_path
  end

  private
    def patient_params
      params.require(:patient).permit(:name, :dob, :address, :phone_number)
    end

    def set_patient
      @patient = Patient.find_by(id: params[:id])
    end
end
