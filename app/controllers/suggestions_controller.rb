class SuggestionsController < ApplicationController
  def index
    @suggestions = policy_scope(Suggestion).tagged_with(params[:interest])
    @suitcase = Suitcase.find(params[:suitcase_id])
  end
end
