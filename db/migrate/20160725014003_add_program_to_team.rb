class AddProgramToTeam < ActiveRecord::Migration
  def change
    add_reference :teams, :program
  end
end
