class  WelcomeController < ApplicationController
  def index

  end

  def dashboard
    authenticate_user!
    @user = current_user
  end
end
