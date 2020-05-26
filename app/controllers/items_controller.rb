class ItemsController < ApplicationController
  
  def new 
    @suitcase = Suitcase.find(params[:suitcase_id])
    @item = Item.new 
    authorize @item
  end

  def create
    @suitcase = Suitcase.find(params[:suitcase_id])
    @item = Item.new(item_params)
    authorize @item
    @item.suitcase = @suitcase
    user = @suitcase.user
    user = current_user
    if @item.save
      flash[:notice] = "Your item has been submitted"
      redirect_to suitcase_path(@suitcase)
    else
      @item = Item.new
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
        params.require(:item).permit(:name)
    end


end
