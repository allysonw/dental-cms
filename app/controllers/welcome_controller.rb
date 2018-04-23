class  WelcomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to dashboard_path
    end
  end

  def dashboard
    authenticate_user!
    @user = current_user
  end
end
