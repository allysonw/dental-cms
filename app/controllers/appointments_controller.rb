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
    computed_time = compute_appointment_date_time(params, appointment_params)

    @appointment = Appointment.new(location: appointment_params[:location], user_id: appointment_params[:user_id], patient_id: appointment_params[:patient_id], time: computed_time)

    binding.pry

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
    computed_time = compute_appointment_date_time(params, appointment_params)
    
    @appointment.update(location: appointment_params[:location], user_id: appointment_params[:user_id], patient_id: appointment_params[:patient_id], time: computed_time)
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

      if request.referrer.include?("/appointments/#{@appointment.id}")
        # if we were on the appointments show page
        redirect_to appointments_path
      else
        redirect_back(fallback_location: appointments_path)
      end
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
        @user_id = @user.id # provide the default value for the user filter select to the view
      else
        @user_id = nil
      end
    end

    # Helper for filtered display
    def set_appointments_patient
      @patient = Patient.find_by(id: params[:patient])
      if @patient
        @patient_id = @patient.id # provide the default value for the patient filter select to the view
      else
        @patient_id = nil
      end
    end

    def compute_appointment_date_time(params, appointment_params)
      date_values = params[:date].split('/')
      month = date_values[0].to_i
      day = date_values[1].to_i
      year = date_values[2].to_i
      hour = appointment_params['time(4i)'].to_i
      minute = appointment_params['time(5i)'].to_i

      DateTime.new(year, month, day, hour, minute, 00, Rational(-7,24))
    end
end
