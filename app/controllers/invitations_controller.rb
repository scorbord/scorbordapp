class InvitationsController < ApplicationController

  before_action :only => :redeem do
    redirect_to(login_path) unless Invitation.find_by(token: params[:invitation_id]).present?
  end

  def new
    @invitation = Invitation.new
    if ENV['BETA_STATUS'] == "ON"
      render :layout => 'beta'
    else
      render :layout => 'materialhome'
    end
  end

  def create
    @invitation = Invitation.new(invitation_params)
		@invitation.token = SecureRandom.uuid
    if User.find_by(email: @invitation.email) == nil
      if @invitation.save
				UserMailer.invitation_request_admin_notify(@invitation).deliver_now
        redirect_to root_path
        flash[:success] = "Thank you, #{@invitation.first_name}.  Your request has been submitted."
      else
        render 'new', :layout => 'materialhome'
      end
    else
      @invitation.errors.set(:email, ['has already been signed up!'])
      render 'new', :layout => 'materialhome'
    end
  end

	def redeem
		@invitation ||= Invitation.find_by(token: params[:invitation_id])
		@user = User.find_by(email: @invitation.email, first_name: @invitation.first_name, last_name: @invitation.last_name)
    render :layout => 'beta'
	end

  private

    def invitation_params
      params.require(:invitation).permit(:first_name, :last_name, :email, :token)
    end

end
