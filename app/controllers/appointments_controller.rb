class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: [:edit, :show, :update, :destroy]

  def index
    @appointments = Appointment.all
  end

  def show
    if @appointment.nil?
      appointment_not_found
    end
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      flash[:message] = "Appointment successfully created!"
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
      flash[:message] = "Appointment successfully updated!"
      redirect_to appointment_path(@appointment)
    else
      render :edit
    end
  end

  def destroy
    if @appointment.destroy
      flash[:message] = "Appointment successfully deleted!"
      redirect_to appointments_path
    else
      appointment_not_found
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
      flash[:notice] = "Appointment not found"
      redirect_to appointments_path
    end
end
