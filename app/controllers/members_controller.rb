class MembersController < ApplicationController
  def new
    @member = Member.new
    @suitcase = Suitcase.find(params[:suitcase_id])
    authorize @member
  end

  def create
    @member = Member.new
    @usermail = params[:member][:email]
    @user = User.find_by(email: @usermail)
    @member.user_id = @user.id
    @suitcase = Suitcase.find(params[:suitcase_id])
    @member.suitcase = @suitcase
    authorize @member
    if @member.save
      redirect_to new_suitcase_member_path(@suitcase)
    else
      flash[:alert] = "#{@member.errors.messages[:user_id].first}"
      render :new
    end
  end
end
