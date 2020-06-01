class ItemsController < ApplicationController

  def new
    @suitcase = Suitcase.find(params[:suitcase_id])
    @item = Item.new
    authorize @item
  end

  def create
    @suitcase = Suitcase.find(params[:suitcase_id])
    @item = Item.new(item_params)
    @member = @suitcase.members.find_by(user_id: params[:item][:user_in_charge])
    @item.member = @member
    @item.suitcase = @suitcase
    authorize @item
    if @item.save
      redirect_to suitcase_path(@suitcase)
    else
      @item = Item.new
      @items = @suitcase.items
      render "suitcases/show"
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
    if params[:suggestion_name]
      return { name: params[:suggestion_name] }
    else
      params.require(:item).permit(:name, :shared)
    end
  end
end
