class Admin::ProgramsController < Admin::BaseController

  def new
    @program = Program.new
  end

  def create
  end

end
