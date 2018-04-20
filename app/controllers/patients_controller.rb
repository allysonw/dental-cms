class PatientsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if params[:user_id]
      @patients = User.find(params[:user_id]).patients.uniq
    else
      @patients = Patient.all
    end
  end

  def show
    @patient = Patient.find_by(id: params[:id])

    if @patient.nil?
      flash[:notice] = "Patient not found"
      redirect_to patients_path
    else
      @appointments = @patient.appointments
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
    def patients_params
    end
end
