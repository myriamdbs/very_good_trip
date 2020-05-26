class ItemsController < ApplicationController
  def new 
   @suitcase = Item.new
  end

  def create
  end

  def destroy
    @item = Item.find(params[:id])
    authorize @item
    @item.destroy
    redirect_to suitcase_path(@item.suitcase)
  end

end
