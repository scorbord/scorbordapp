class ChangeTeamSportToEnum < ActiveRecord::Migration
  def change
    remove_column :teams, :sport
    add_column :teams, :sport, :integer
  end
end
