class Admin::InvitationsController < Admin::BaseController

	def index
		@invitations = Invitation.all.order(:created_at)
	end

  def accept
    @inv = Invitation.find_by(id: params[:invitation_id])
    @user = UserBuilder.new(@inv).setup_user_from_invite
    @inv.status = 'Approved'
    if @user.save
      if @inv.save
        UserMailer.invitation_email(@inv).deliver_now
        redirect_to admin_invitations_path
      else
        flash[:error] = "Invitation was not saved"
        redirect_to admin_invitations_path
      end
    else
      flash[:error] = "User did not save"
      redirect_to admin_invitations_path
    end
  end

	def destroy
		Invitation.find_by(id: params[:id]).delete
		flash[:success] = "Invitation successfully deleted"
		redirect_to admin_invitations_path
	end
end
