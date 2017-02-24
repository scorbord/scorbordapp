class ChangeMemberRoleFieldType < ActiveRecord::Migration
  def up
    remove_column :members, :role
    add_column :members, :role, :integer
  end

  def down
    change_column :members, :role, :string
  end
end
