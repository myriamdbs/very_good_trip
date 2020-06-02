class ItemSharedController < ApplicationController
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
      redirect_to new_suitcase_item_path(@suitcase)
      flash[:alert] = "#{@item.name.capitalize} a été ajouté"
    else
      @item = Item.new
      @items = @suitcase.items
      render "suitcases/show"
    end
  end

  private

  def item_params
      params.require(:item).permit(:name, :shared)
  end
end
