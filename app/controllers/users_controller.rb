class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def new
  	@user = User.new
    render :layout => 'materialhome'
  end

  def show
    @user = User.find(params[:id])
    @teams = @user.teams
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      #log_in @user
      remember_requester(@user.first_name)
  		redirect_to confirmation_path
  	else
  		render 'new', :layout => 'materialhome'
  	end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update
      # flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

	private

		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
		end

    # Before Filters

    # Confirms a logged-in User
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end
