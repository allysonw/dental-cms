module AppointmentsHelper
  def date_and_time(appointment)
    appointment.time.strftime("%A, %B %e, at %l:%M %p")
  end

  def appointment_confirm_text
     "Are you sure you would like to delete this appointment? This will also delete the appointment's notes!"
  end

  def show_appointment_notes(appointment)
    if !appointment.appointment_notes.blank?
      render partial: 'appointment_notes/notes_table', locals: { appointment: appointment }
    end
  end

end
