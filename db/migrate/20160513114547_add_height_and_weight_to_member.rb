class AddHeightAndWeightToMember < ActiveRecord::Migration
  def change
    add_column :members, :height, :integer
    add_column :members, :weight, :integer
  end
end
