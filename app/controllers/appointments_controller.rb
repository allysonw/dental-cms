class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: [:edit, :show, :update, :destroy]

  def index
    @appointments = Appointment.all
  end

  def show
    if @appointment.nil?
      appointment_not_found
    else
      @appointment_note = @appointment.appointment_notes.build
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
      redirect_to appointments_path
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
end
