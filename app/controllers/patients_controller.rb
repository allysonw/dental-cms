class PatientsController < ApplicationController
  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find_by(id: params[:id])

    if @patient.nil?
      flash[:notice] = "Patient not found"
      redirect_to patients_path
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
