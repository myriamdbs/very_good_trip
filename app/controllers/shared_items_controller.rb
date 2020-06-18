class SharedItemsController < ApplicationController
  before_action :find_suitcase, only: [:new, :create]

  def new
    @item = Item.new
    authorize @item
  end

  def create
    @item = Item.new(item_params)
    @item.suitcase = @suitcase
    member_attribution
    authorize @item
    if @item.save
      redirect_to suitcase_path(@suitcase)
    else
      render :new
    end
  end

  private

  def item_params
      params.require(:item).permit(:name, :shared)
  end

  def find_suitcase
    @suitcase = Suitcase.find(params[:suitcase_id])
  end

  def member_attribution
    @member = @suitcase.members.find_by(user_id: params[:item][:user_in_charge])
    @item.member = @member
    if @member.nil?
      @member = @suitcase.members.find_by(user: current_user)
      @item.member = @member
    end
  end
end
