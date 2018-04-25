module AppointmentNotesHelper
  def created_at(note)
    note.created_at.strftime("%b %e, %Y - %l:%M %p")
  end
end
