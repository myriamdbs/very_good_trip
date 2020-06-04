class TicksController < ApplicationController
  def update
    @item = Item.find(params[:item_id])
    authorize @item
    @item.update packed: !@item.packed
    @items = @item.suitcase.items
  end
end
