class Announcement < ApplicationRecord

  def next()
    if announcement = Announcement.where("id < ?", self.id).last
      announcement;
    else
      Announcement.last;
    end
  end
end
