class RenameMembershipstoMembers < ActiveRecord::Migration
  def change
  	rename_table :memberships, :members
  end
end
