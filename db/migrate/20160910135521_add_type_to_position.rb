class AddTypeToPosition < ActiveRecord::Migration
  def change
    add_column :positions, :type, :integer
  end
end
