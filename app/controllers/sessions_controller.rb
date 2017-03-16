class SessionsController < ApplicationController

  layout :beta_layout?

  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)

  	if user && user.authenticate(params[:session][:password])
  		log_in user
  		remember user
  		redirect_back_or(user)
  	else
  		flash.now[:error] = 'Invalid email-password combination.'
      render 'new'
  	end
  end

  def destroy
  	log_out if logged_in?
  	redirect_to root_url
  end

  def set_current_team
    current_user.update_attribute(:current_team_id, params[:team_id])
    redirect_to current_team
  end

  private

    def beta_layout?
      if ENV['BETA_STATUS'] == "ON"
        'beta'
      else
        'materialhome'
      end
    end

end
