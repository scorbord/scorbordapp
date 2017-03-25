class Admin::TeamsController < Admin::BaseController
	def new
		@school = School.find(params[:school_id])
		@team = @school.teams.new
	end

	def create
		@team = Team.create(school_id: params[:school_id], name: params[:team][:name])
		if TeamBuilder.new(@team).build_complete
			redirect_to admin_school_path(School.find(params[:school_id]))
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
