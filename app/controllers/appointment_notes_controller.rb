class AppointmentNotesController < ApplicationController

  def create
    @appointment = Appointment.find_by(id: appointment_note_params[:appointment_id])
    @appointment_note = AppointmentNote.new(appointment_note_params)


    if @appointment_note.save && @appointment
      respond_to do |f|
        f.html {
          flash[:success] = "Appointment note successfully created!"
          redirect_to appointment_path(@appointment)
        }
        f.json {
          render json: @appointment_note, status: 201
        }
      end
    elsif @appointment
      render "appointments/show"
    else
      redirect_to appointments_path, alert: "Something went wrong..."
    end
  end

  private
    def appointment_note_params
      params.require(:appointment_note).permit(:content, :appointment_id)
    end
end
