class Invitations::UsersController < ApplicationController

  def update
    inv = Invitation.find(params[:invitation_id])
    @user = User.find_by(user_params.except(:password, :password_confirmation))

    unless user_params[:password].empty?
      if user_params[:password] == user_params[:password_confirmation]
        @user.password = user_params[:password]
        @user.password_confirmation = user_params[:password_confirmation]
        if @user.save
          inv.delete
          log_in(@user)
          redirect_to @user
        else
          flash[:error] = @user.errors.full_messages.join(', ')
          redirect_to invitation_redeem_path(inv.token)
        end
      else
        @user.errors.add(:password_confirmation, "doesn't match")
        flash[:error] = @user.errors.full_messages.join(', ')
        redirect_to invitation_redeem_path(inv.token)
      end
    else
      @user.errors.add(:password, "can't be blank")
      flash[:error] = @user.errors.full_messages.join(', ')
      redirect_to invitation_redeem_path(inv.token)
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
