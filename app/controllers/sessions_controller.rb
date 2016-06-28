class SessionsController < ApplicationController

  def new
    render :layout => 'materialhome'
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)

  	if user && user.authenticate(params[:session][:password])
  		log_in user
  		remember user
  		redirect_back_or(user)
  	else
  		# tell them they messed up
  		flash.now[:danger] = 'Invalid email-password combination.'
  		# and send them back to the login page
  		render 'new', :layout => 'materialhome'
  	end
  end

  def destroy
  	log_out if logged_in?
  	redirect_to root_url
  end
end
