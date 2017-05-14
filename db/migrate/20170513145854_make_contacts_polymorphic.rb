class MakeContactsPolymorphic < ActiveRecord::Migration
  def up
    rename_column :contacts, :prospect_id, :relatable_id
    add_column :contacts, :relatable_type, :string
    Contact.reset_column_information
    Contact.update_all(:relatable_type => "Prospect")

    add_index :contacts, [:relatable_type, :relatable_id]
  end
  def down
    rename_column :contacts, :relatable_id, :prospect_id
    remove_column :contacts, :relatable_type
  end
end
