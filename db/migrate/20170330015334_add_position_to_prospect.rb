class AddPositionToProspect < ActiveRecord::Migration
  def change
    add_column :prospects, :position, :string
  end
end
