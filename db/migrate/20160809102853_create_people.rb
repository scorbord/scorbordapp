class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.float :height
      t.integer :weight
      t.integer :gender
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
