class PasswordResetController < ApplicationController

  if ENV['BETA_STATUS'] == "ON"
    layout 'beta'
  else
    layout 'materialhome'
  end

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    UserMailer.password_reset_notification(@user).deliver_now
    redirect_to login_path
    flash[:success] = "An email has been sent to #{@user.email.downcase} with instructions for setting a new password"
  end

  def edit
    if User.find_by(password_reset_token: params[:id])
      @user = User.find_by(password_reset_token: params[:id])
    else
      redirect_to root_path
      flash[:error] = "The reset password link you used is no longer valid."
    end
  end

  def update
    @user = User.find_by(password_reset_token: params[:id])
    if @user.update_attributes(user_params)
      @user.password_reset_token = SecureRandom.uuid
      if @user.save
        log_in @user
        redirect_to profile_path
        flash[:success] = "Your password has been successfully changed!"
      end
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

end
