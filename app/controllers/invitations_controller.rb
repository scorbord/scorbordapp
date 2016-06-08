class InvitationsController < ApplicationController

  def new
    @invitation = Invitation.new
    render :layout => 'materialhome'
  end

  def create
    @invitation = Invitation.new(invitation_params)
    if @invitation.save
      redirect_to root_path
      flash[:success] = "Thank you, #{@invitation.first_name}.  Your request has been submitted."
    else
      render 'new', :layout => 'materialhome'
    end
  end


  private

    def invitation_params
      params.require(:invitation).permit(:first_name, :last_name, :email)
    end

end
