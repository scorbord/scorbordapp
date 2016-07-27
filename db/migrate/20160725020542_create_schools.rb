class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :initials
      t.string :mascot
      t.timestamps
    end
  end
end
