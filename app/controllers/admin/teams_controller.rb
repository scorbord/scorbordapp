class Admin::TeamsController < Admin::BaseController
	def new
		@program = Program.find(params[:program_id])
		@team = @program.teams.new
	end

	def create
		@team = Team.create(program_id: params[:program_id], name: params[:team][:name])
		if TeamBuilder.new(@team).build_complete
			redirect_to admin_school_path(Program.find(params[:program_id]).school)
		#@program = Program.find(params[:program_id])
		#@team = @program.teams.new(team_params)
		#if @team.save
			#@team.positions << Position.where(sport: @program[:sport])
			#redirect_to admin_team_path(@team)
		else
			flash[:error] = "Something messed up"
			render 'new'
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
