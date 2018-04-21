class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: [:edit, :show]

  def index
    @appointments = Appointment.all
  end

  def show
    if @appointment.nil?
      flash[:notice] = "Appointment not found"
      redirect_to appointments_path
    end
  end

  def new
    @appointment = Appointment.new
  end

  def create
    raise params.inspect
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      raise @appointment.inspect
      redirect_to appointment_path(@appointment)
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
    def appointment_params
      params.require(:appointment).permit(:date, :time, :location, :user_id, :patient_id)
    end

    def set_appointment
      @appointment = Appointment.find_by(id: params[:id])
    end
end
