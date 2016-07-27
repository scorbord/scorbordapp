class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.integer :sport
    end
  end
end
