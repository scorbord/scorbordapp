class InvitationsController < ApplicationController
	before_action :require_user, only: [:index]

  def new
    @invitation = Invitation.new
    render :layout => 'materialhome'
  end

  def create
    @invitation = Invitation.new(invitation_params)
		@invitation.token = SecureRandom.uuid
    if User.find_by(email: @invitation.email) == nil
      if @invitation.save
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

  def index
		@invitations = Invitation.all.order(:created_at)
  end

  def accept
    @inv = Invitation.find_by(id: params[:invitation_id])
    @inv.status = 'Approved'
    if @inv.save
			UserMailer.invitation_email(@inv).deliver_now
      redirect_to invitations_path
    else
      flash[:error] = "Invitation was not saved"
      redirect_to invitations_path
    end
  end

	def destroy
		Invitation.find_by(id: params[:id]).destroy
		flash[:success] = "Invitation successfully deleted"
		redirect_to invitations_path
	end

	def redeem
		@invitation = Invitation.find_by(token: params[:invitation_id])
		@user = User.new(email: @invitation.email, first_name: @invitation.first_name, last_name: @invitation.last_name)
		render :layout => 'materialhome'
	end

  private

    def invitation_params
      params.require(:invitation).permit(:first_name, :last_name, :email, :token)
    end

end
