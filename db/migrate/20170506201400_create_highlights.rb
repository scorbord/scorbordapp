class CreateHighlights < ActiveRecord::Migration
  def change
    create_table :highlights do |t|
      t.integer :prospect_id
      t.integer :source
      t.string :path

      t.timestamps null: false
    end
  end
end
