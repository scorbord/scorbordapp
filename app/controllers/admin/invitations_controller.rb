class Admin::InvitationsController < Admin::BaseController

	def index
		@invitations = Invitation.all.order(:created_at)
	end

  def accept
    @inv = Invitation.find_by(id: params[:invitation_id])
    pwd = SecureRandom.hex(20)
    user = User.new(first_name: @inv.first_name, last_name: @inv.last_name, email: @inv.email, password: pwd, password_confirmation: pwd)

    if user.save
      @inv.status = 'Approved'
      if @inv.save
        UserMailer.invitation_email(@inv).deliver_now
        redirect_to admin_invitations_path
      else
        flash[:error] = "Invitation was not saved"
        redirect_to admin_invitations_path
      end
    else
      flash[:error] = "User was not saved"
      redirect_to admin_invitations_path
    end
  end

	def destroy
		Invitation.find_by(id: params[:id]).delete
		flash[:success] = "Invitation successfully deleted"
		redirect_to admin_invitations_path
	end
end
