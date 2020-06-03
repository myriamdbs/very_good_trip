class SuggestedItemsController < ApplicationController
  def create
    @suitcase = Suitcase.find(params[:suitcase_id])
    @item = Item.new(item_params)
    @item.suitcase = @suitcase
    authorize @item
    if @item.save
      redirect_back(fallback_location: root_path)
      flash[:alert] = "#{@item.name.capitalize} a été ajouté"
    else
      render :new
    end
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

