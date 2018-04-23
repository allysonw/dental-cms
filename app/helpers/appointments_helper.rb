module AppointmentsHelper
  def date_and_time(appointment)
    appointment.time.strftime("%A, %B %e, at %l:%M %p")
  end
end
