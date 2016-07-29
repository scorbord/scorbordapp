class Admin::SchoolsController < Admin::BaseController

	def new
		@school = School.new
	end

	def create
		@school = School.new(school_params)
		if @school.save
			redirect_to admin_school_path(@school)
		else
			render edit
		end
	end

	def index
		@schools = School.all.order(:name)
	end

	def show
		@school = School.find(params[:id])
	end

	def edit
		@school = School.find(params[:id])
	end

	def update
		@school = School.find(params[:id])
		if @school.update_attributes(school_params)
			redirect_to admin_school_path(@school)
		else
			render 'edit'
		end
	end

	private

		def school_params
			params.require(:school).permit(:name, :initials, :mascot)
		end

end
