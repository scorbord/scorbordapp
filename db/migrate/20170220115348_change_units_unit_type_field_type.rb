class ChangeUnitsUnitTypeFieldType < ActiveRecord::Migration
  def up
    remove_column :units, :unit_type
    add_column :units, :unit_type, :integer
  end

  def down
    change_column :units, :unit_type, :string
  end
end
