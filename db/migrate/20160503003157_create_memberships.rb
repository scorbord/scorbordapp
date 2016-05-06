class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :team, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.boolean :admin, default: false
      t.timestamps
    end
  end
end
