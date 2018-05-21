class AnnouncementsController < ApplicationController

  def show
    @announcement = Announcement.find_by(id: params[:id])

    respond_to do |f|
      f.html { redirect_to dashboard_path}
      f.json { render json: @announcement, status: 200 }
    end
  end

end
