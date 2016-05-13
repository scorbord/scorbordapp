class AddGradYearToMember < ActiveRecord::Migration
  def change
    add_column :members, :grad_year, :string
  end
end
