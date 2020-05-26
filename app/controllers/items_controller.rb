class ItemsController < ApplicationController
  def new
  end

  def create
  end

  def destroy

  end

  def pack!
    @item = Item.find(params[:id])
    @item.packed = !@item.pac
  end
end
