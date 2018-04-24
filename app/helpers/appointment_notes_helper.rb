module AppointmentNotesHelper
  def note_created_at(note)
    note.created_at.strftime("%A, %B %e, at %l:%M %p")
  end
end
