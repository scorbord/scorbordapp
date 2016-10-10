class AddJerseyNumberToMembers < ActiveRecord::Migration
  def change
    add_column :members, :jersey_number, :integer
  end
end
