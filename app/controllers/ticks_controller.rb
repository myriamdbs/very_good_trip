class TicksController < ApplicationController
  def update
    @item = Item.find(params[:item_id])
    authorize @item
    @item.update packed: !@item.packed
    redirect_to suitcase_path(@item.suitcase)
  end
end
