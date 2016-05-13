class AddEmailToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :email, :string, :after => :user_id
  end
end
