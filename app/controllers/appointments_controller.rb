class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
  end

  def show
    @appointment = Appointment.find_by(id: params[:id])

    if @appointment.nil?
      flash[:notice] = "Appointment not found"
      redirect_to appointments_path
    end
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
    def appointments_params
      params.require(:appointment).permit(:date, :time, :location) # patient/user id??
    end
end
