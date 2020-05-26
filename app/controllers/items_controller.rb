class ItemsController < ApplicationController
  def new
  end

  def create
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to suitcase_path(@item.suitcase)
  end

  def pack!
    @item = Item.find(params[:id])
    @item.packed = !@item.pac
  end
end
