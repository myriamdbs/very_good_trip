class ItemsController < ApplicationController
  def new
  end

  def create
  end

  def destroy

  end

  def pack
    @item.pack = true
  end
end
