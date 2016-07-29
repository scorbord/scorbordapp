class Admin::ProgramsController < Admin::BaseController

  def new
		@school = School.find(params[:school_id])
		@program = @school.programs.new
  end

  def create
		@school = School.find(params[:school_id])
		@program = @school.programs.new(sport: params[:program][:sport].to_i)
		if @program.save
			redirect_to admin_school_path(@school)
		else
			render 'new'
		end
  end

	def destroy
		@program = Program.find(params[:id])
		if @program.delete
			redirect_to admin_school_path(params[:school_id])
		end
	end
end
