class AddStatusToInvitation < ActiveRecord::Migration
  def change
    add_column :invitations, :status, :text
  end
end
