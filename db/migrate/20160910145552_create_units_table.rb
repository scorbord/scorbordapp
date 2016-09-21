class CreateUnitsTable < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :name
      t.string :initials
      t.integer :coach_position_id
      t.string :type
      t.integer :parent_unit_id

      t.timestamps
    end
  end
end
