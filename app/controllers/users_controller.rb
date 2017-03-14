class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update]
  before_action :correct_user, only: [:edit, :update]


  def show
    @user = User.find(params[:id])
    @teams = @user.teams
  end

  def create
  	@user = User.new(user_params)
    if params[:user][:password] && params[:user][:password] == params[:user][:password_confirm]
      if @user.save
        log_in @user
        remember_requester(@user.first_name)
        redirect_to @user
      end
    else
      @user.errors.set(:password, ['must match!'])
      flash[:error] = "Password and Password Confirm must match!"
      redirect_to :back
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
		if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
			if @user.update_attributes(user_params)
				# Handle a successful update
				# flash[:success] = "Profile updated"
				redirect_to @user
			else
				render 'edit'
			end
		else
			if is_password?(params[:user][:current_password])
				if @user.update_attributes(user_params)
					redirect_to @user
				else
					render 'edit'
				end
			else
				flash.now[:error] = 'Current password was incorrect'
				render 'edit'
			end
		end
  end

	private

		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
		end

    # Confirms the correct user
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

		def is_password?(string)
				BCrypt::Password.new(@user.password_digest).is_password?(string)
		end

end
