module SessionsHelper

	# Logs the given user IN
	def log_in(user)
		session[:user_id] = user.id
		current_team
	end

	# Remembers a user in a permanent session
	def remember(user)
		user.remember
		cookies.permanent.signed[:user_id] = user.id
		cookies.permanent[:remember_token] = user.remember_token
	end

	# Forgets a persistent session
	def forget(user)
		user.forget
		cookies.delete(:user_id)
		cookies.delete(:remember_token)
	end

	# Logs the current user OUT
	def log_out
		forget(current_user)
		session.delete(:user_id)
		@current_user = nil
	end

	# Returns the current user if there is one
	def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
	end

	def current_user?(user)
		user == current_user
	end

	# Returns 'true' if a user is logged in and 'false' if not
	def logged_in?
		!current_user.nil?
	end

	# Redirects to stored location (or to the default).
  def redirect_back_or(default)
  	redirect_to(session[:forwarding_url] || default)
  	session.delete(:forwarding_url)
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end

  def remember_requester(first_name)
  	session[:requester_first_name] = first_name
  end

  def requester
  	session[:requester_first_name]
  end

	def require_user
		redirect_to(login_path) unless logged_in?
		flash[:error] = "You must be logged in to do that."
	end

	def current_team
		if current_user.current_team_id
			current_user.current_team
		elsif current_user.teams.any?
			current_user.update_attribute(:current_team_id, current_user.teams.first.id)
			current_user.current_team
		else
			Team.new(name: "STILL MISSING A TEAM")
		end
	end

	def current_team?(team)
		current_user.current_team == team
	end

	def admin_of_current_team?(user)
		user.memberships.where("team_id = #{current_team.id}").pluck(:admin).include?(true)
	end

	def admin_or_coach_of_current_team?(user)
		user.memberships.where("team_id = #{current_team.id}").pluck(:admin).include?(true) || user.memberships.where("team_id = #{current_team.id}").pluck(:role).include?(0)
	end

end
