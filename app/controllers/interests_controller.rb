class InterestsController < ApplicationController
  def index
    @interests = policy_scope(Suggestion).all_tags
    @suitcase = Suitcase.find(params[:suitcase_id])
  end
end
