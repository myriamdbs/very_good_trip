class ItemsController < ApplicationController
  before_action :find_suitcase, only: [:new, :create]

  def new
    @item = Item.new
    authorize @item
  end

  def create
    @item = Item.new(item_params)
    @item.suitcase = @suitcase
    @item.member = @suitcase.members.find_by(user: current_user)
    authorize @item
    if @item.save
      redirect_to suitcase_path(@suitcase)
    else
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    authorize @item
    @item.destroy
    redirect_to suitcase_path(@item.suitcase)
  end

private

  def item_params
      params.require(:item).permit(:name, :shared)
  end

  def find_suitcase
    @suitcase = Suitcase.find(params[:suitcase_id])
  end
end
