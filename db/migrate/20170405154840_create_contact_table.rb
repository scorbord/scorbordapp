class CreateContactTable < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :prospect_id
      t.integer :relation
      t.string :salutation
      t.string :first_name
      t.string :last_name
      t.string :primary_phone
      t.string :secondary_phone
      t.string :email
      t.string :facebook
      t.string :twitter
      t.string :instagram
      t.string :snapchat
    end
  end
end
