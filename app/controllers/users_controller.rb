class UsersController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @user = current_user
    @appointments = current_user.appointments
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])

    if @user.nil?
      flash[:notice] = "User not found"
      redirect_to users_path
    end
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
    def users_params
      params.require(:user).permit(:name, :email) # other stuff??
    end

end
