class MembersController < ApplicationController
  def new
    @member = Member.new
    @suitcase = Suitcase.find(params[:suitcase_id])
    authorize @member
  end

  def create
    @member = Member.new
    @usermail = params["Email"]
    @member.user_id = User.find_by(email: @usermail).id
    @suitcase = Suitcase.find(params[:suitcase_id])
    @member.suitcase = @suitcase
    authorize @member
    if @member.save
      render :new
    else
      redirect_to suitcase_path(@suitcase)
    end
  end
end
