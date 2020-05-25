class SuitcasesController < ApplicationController
  def index
    @suitcases = Suitcase.all
  end
end
