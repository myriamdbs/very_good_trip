class SuitcasesController < ApplicationController
  before_action :find_suitcase, only: [:show]

  def index
    @suitcases = Suitcase.all
  end

  def new
    @suitcase = Suitcase.new
  end

  def create
    @suitcase = Suitcase.new(suitcase_params)
    @suitcase.user = current_user
    if @suitcase.save
      redirect_to suitcases_path
    else
      render :new
    end
  end

  def show

  end

private

  def find_suitcase
    @suitcase = Suitcase.find(params[:id])
  end

  def suitcase_params
    params.require(:suitcase).permit(:name, :destination, :start_date, :end_date, :shared, :user)
  end

end
