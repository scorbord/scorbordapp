class Admin::TeamsController < Admin::BaseController
	def new
		@program = Program.find(params[:program_id])
		@team = @program.teams.new
	end

	def create
		@program = Program.find(params[:program_id])
		@team = @program.teams.new(team_params)
		if @team.save
			@team.positions << Position.where(sport: @program[:sport])
			redirect_to admin_team_path(@team)
		end
	end

	def show
		@team = Team.find(params[:id])
	end

	private

		def team_params
			params.require(:team).permit(:name)
		end

end
