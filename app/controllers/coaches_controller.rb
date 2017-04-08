class CoachesController < ApplicationController

  def new
    @prospect = Prospect.find(params[:prospect_id])
    @coach = @prospect.coaches.new
  end

  def create
    @prospect = Prospect.find(params[:prospect_id])
    @coach = @prospect.coaches.new(coach_params)
    if @coach.save
      redirect_to @coach.prospect
    else
      render :new
    end
  end

  def edit
    @prospect = Prospect.find(params[:prospect_id])
    @coach = Coach.find(params[:id])
  end

  def update
    @coach = Coach.find(params[:id])
    if @coach.update_attributes(coach_params)
      redirect_to @coach.prospect
    else
      render :edit
    end
  end

  def destroy
    @coach = Coach.find(params[:id])
    if @coach.delete
      flash[:success] = "#{@coach.first_name} deleted"
      redirect_to @coach.prospect
    else
      render :back
    end
  end

  private

    def coach_params
      params.require(:coach).permit(
        :prospect_id,
        :first_name,
        :last_name,
        :program_kind,
        :program_name,
        :primary_phone,
        :email
      )
    end
end
