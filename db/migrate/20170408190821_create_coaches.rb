class CreateCoaches < ActiveRecord::Migration
  def change
    create_table :coaches do |t|
      t.string :first_name
      t.string :last_name
      t.integer :prospect_id
      t.string :program_name
      t.integer :program_kind
      t.string :primary_phone
      t.string :email
    end
  end
end
