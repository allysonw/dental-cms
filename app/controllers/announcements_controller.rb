class AnnouncementsController < ApplicationController
  before_action :set_announcement, only: [:next, :show]

  def show
    respond_to do |f|
      f.html { redirect_to dashboard_path}
      f.json { render json: @announcement, status: 200 }
    end
  end


  def index
    @announcements = Announcement.all.sort do |a,b|
      a.created_at > b.created_at ? -1 : 1
    end

    respond_to do |f|
      f.html { redirect_to dashboard_path}
      f.json { render json: @announcements, status: 200 }
    end
  end

  def next
    @next_announcement = @announcement.next

    respond_to do |f|
      f.html { redirect_to dashboard_path}
      f.json { render json: @next_announcement, status: 200 }
    end
  end

  private

    def set_announcement
      @announcement = Announcement.find_by(id: params[:id])
    end

end
