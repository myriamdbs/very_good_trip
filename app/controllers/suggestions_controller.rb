class SuggestionsController < ApplicationController
  def index
    @suggestions = policy_scope(Suggestion).tagged_with(params[:interest])
    @suitcase = Suitcase.find(params[:suitcase_id])
  end

  def create
    @suitcase = Suitcase.find(params[:suitcase_id])
    @item = Item.new(item_params)
    @item.suitcase = @suitcase
    authorize @item
    if @item.save
      redirect_back(fallback_location: root_path)
    else
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    authorize @item
    @item.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def item_params
    params[:suggestion_name] = { name: params[:suggestion_name] }
    params.require(:suggestion_name).permit(:name)
  end
end
