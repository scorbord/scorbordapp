class ChangePersonHeightToInteger < ActiveRecord::Migration
  def change
    change_column :people, :height, :integer
  end
end
