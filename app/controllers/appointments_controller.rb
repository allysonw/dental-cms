class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: [:edit, :show, :update, :destroy]

  def index
    # provide lists of users and patients to the view for the filter controls
    @users = User.all
    @patients = Patient.all

    # filter the @appointments list based on user input
    if !params[:user].blank? && !params[:patient].blank?
      @appointments = Appointment.for_user_and_patient(params[:user], params[:patient])
      set_appointments_user
      set_appointments_patient

    elsif !params[:user].blank?
      @appointments = Appointment.for_user(params[:user])
      set_appointments_user

    elsif !params[:patient].blank?
      @appointments = Appointment.for_patient(params[:patient])
      set_appointments_patient

    else
      @appointments = Appointment.all
    end

  end

  def show
    if @appointment.nil?
      appointment_not_found
    else
      @appointment_note = AppointmentNote.new
    end
  end

  def new
    if params[:patient_id] && !Patient.exists?(params[:patient_id])
      redirect_to patients_path, alert: "Patient not found."
    elsif params[:patient_id]
      @appointment = Appointment.new(patient_id: params[:patient_id])
    else
      @appointment = Appointment.new
    end
  end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      flash[:success] = "Appointment successfully created!"
      redirect_to appointment_path(@appointment)
    else
      flash[:notice] = "Please fill out all fields."
      render :new
    end
  end

  def edit
    if @appointment.nil?
      appointment_not_found
    end
  end

  def update
    @appointment.update(appointment_params)
    if @appointment.save
      flash[:success] = "Appointment successfully updated!"
      redirect_to appointment_path(@appointment)
    else
      render :edit
    end
  end

  def destroy
    if @appointment.nil?
      appointment_not_found
    else
      @appointment.destroy
      flash[:success] = "Appointment successfully deleted!"
      redirect_back(fallback_location: appointments_path)
    end
  end

  private
    def appointment_params
      params.require(:appointment).permit(:date, :time, :location, :user_id, :patient_id)
    end

    def set_appointment
      @appointment = Appointment.find_by(id: params[:id])
    end

    def appointment_not_found
      flash[:alert] = "Appointment not found"
      redirect_to appointments_path
    end

    # Helper for filtered display
    def set_appointments_user
      @user = User.find_by(id: params[:user])
      if @user
        @user_id = @user.id
      else
        @user_id = nil
      end
    end

    # Helper for filtered display
    def set_appointments_patient
      @patient = Patient.find_by(id: params[:patient])
      if @patient
        @patient_id = @patient.id
      else
        @patient_id = nil
      end
    end
end
