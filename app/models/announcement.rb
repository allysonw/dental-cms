class Announcement < ApplicationRecord

  def next()
    if announcement = Announcement.where("id > ?", self.id).first
      announcement;
    else
      Announcement.first;
    end
  end
end
