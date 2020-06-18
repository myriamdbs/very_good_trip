class SuitcasesController < ApplicationController
  before_action :find_suitcase, only: [:show]

  def index
    @suitcases = policy_scope(Suitcase).order(start_date: :asc)
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
      Member.create(suitcase: @suitcase, user: current_user)
      if @suitcase.shared
        redirect_to new_suitcase_member_path(@suitcase)
      else
        redirect_to suitcase_path(@suitcase)
      end
    else
      render :new
    end
  end

  def show
    authorize @suitcase
    @items =  case params["filter"]
    when "all"
      @suitcase.items
    when "checked"
      @checked = true
      @suitcase.items.packed
    when "unchecked"
      @unchecked = true
      @suitcase.items.unpacked
    when "shared"
      @shared = true
      @suitcase.items.shared
    else
      @suitcase.items
    end
  end

private

  def find_suitcase
    @suitcase = Suitcase.find(params[:id])
  end

  def suitcase_params
    params.require(:suitcase).permit(:name, :destination, :start_date, :end_date, :shared, :user, :photo, :member)
  end

  def add_essential_items
    @items = []
    [ "chargeur de téléphone", "dentifrice", "brosse à dents" ].each do |item_name|
    @items << Item.create(name: item_name, suitcase: @suitcase)
    end
  end
end
