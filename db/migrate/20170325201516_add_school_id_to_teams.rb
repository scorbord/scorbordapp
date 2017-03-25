class AddSchoolIdToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :school_id, :integer
    remove_column :teams, :program_id
  end
end
