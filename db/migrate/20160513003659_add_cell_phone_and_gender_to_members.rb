class AddCellPhoneAndGenderToMembers < ActiveRecord::Migration
  def change
    add_column :members, :cell_phone, :string
    add_column :members, :gender, :string
  end
end
