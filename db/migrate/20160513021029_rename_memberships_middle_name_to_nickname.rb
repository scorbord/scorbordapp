class RenameMembershipsMiddleNameToNickname < ActiveRecord::Migration
  def change
  	change_table :members do |t|
  		t.rename :middle_name, :nickname
  	end
  end
end
