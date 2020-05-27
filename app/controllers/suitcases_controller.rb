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
      add_essential_items
      redirect_to suitcase_path(@suitcase)
    else
      render :new
    end
  end

  def show
    authorize @suitcase
    @items = @suitcase.items
  end

private

  def find_suitcase
    @suitcase = Suitcase.find(params[:id])
  end

  def suitcase_params
    params.require(:suitcase).permit(:name, :destination, :start_date, :end_date, :shared, :user, :photo)
  end

  def add_essential_items
    @items = []
    ["brosse à dents", "dentifrice", "déodorant", "rasoir", "mousse à raser", "parfum", "crème pour le visage", "préservatifs", "somnifères", "sous-vêtements", "jeans", "t-shirts", "pulls", "chemises", "sweatshirts", "ceinture", "chausettes", "écharpe", "gants", "chaussures", "chargeur de téléphone"].each do |item_name|
    @items << Item.create(name: item_name, suitcase: @suitcase)
    end
  end
end
