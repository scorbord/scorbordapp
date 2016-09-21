class AddUnitToPositions < ActiveRecord::Migration
  def change
    add_column :positions, :unit_id, :integer
  end
end
