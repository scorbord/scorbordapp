class Admin::BaseController < ApplicationController

		before_action do
				unless current_user && current_user.super_admin?
						flash[:error] = "You must be logged in as a SuperAdmin to do that."
						store_location
						redirect_to login_path
				end
		end

end
