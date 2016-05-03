class TeamsController < ApplicationController
	before_action :logged_in_user
	#before_action :correct_user?, only: :destroy

	def new
		@team = Team.new
		render :layout => 'material'
	end

	def create
		@team = Team.new(team_params)
		if @team.save
			@membership = current_user.memberships.new(team_id: @team.id)
			if @membership.save
				redirect_to current_user
			else
				render 'new', :layout => 'material'
			end
		else
			render 'new', :layout => 'material'
		end 
	end

	def edit
		@team = Team.find(params[:id])
		render :layout => 'material'
	end

	def update
		@team = Team.find(params[:id])
		if @team.update_attributes(team_params)
			redirect_to current_user
		else
			render 'edit'
		end
	end

	def destroy
		current_user.teams.find_by(id: params[:id]).destroy
		flash[:success] = "Team successfully deleted"
		redirect_to current_user
	end

	private

		def team_params
			params.require(:team).permit(:name, :sport)
		end

		def correct_user?
			@team = current_user.teams.find(params[:id])
      redirect_to current_user if @team.nil?
    end

end
