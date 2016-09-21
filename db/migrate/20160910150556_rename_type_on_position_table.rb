class RenameTypeOnPositionTable < ActiveRecord::Migration
  def change
    rename_column :positions, :type, :position_type
  end
end
