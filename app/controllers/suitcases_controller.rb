class SuitcasesController < ApplicationController
  before_action :find_suitcase, only: [:show]

  def index
    @suitcases = policy_scope(Suitcase).order(created_at: :desc)
  end

  def new
    @suitcase = Suitcase.new
    authorize @suitcase
  end

  def create
    @suitcase = Suitcase.new(suitcase_params)
    @suitcase.user = current_user
    authorize @suitcase
    if @suitcase.save
      redirect_to suitcases_path
    else
      render :new
    end
  end

  def show
    authorize @suitcase
  end

private

  def find_suitcase
    @suitcase = Suitcase.find(params[:id])
  end

  def suitcase_params
    params.require(:suitcase).permit(:name, :destination, :start_date, :end_date, :shared, :user)
  end

end
