class TeamsController < ApplicationController

	def new
		@team = Team.new
		render :layout => 'material'
	end

	def create
		@team = current_user.teams.build(team_params)
		if @team.save
			redirect_to current_user
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

	private

		def team_params
			params.require(:team).permit(:name, :sport)
		end


end
