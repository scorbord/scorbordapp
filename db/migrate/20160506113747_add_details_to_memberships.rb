class AddDetailsToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :role, :string, after: :admin
    add_column :memberships, :first_name, :string, after: :last_name
    add_column :memberships, :middle_name, :string, after: :first_name
    add_column :memberships, :last_name, :string, after: :user_id
  end
end
