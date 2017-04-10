class ChangeSalutationToEnum < ActiveRecord::Migration
  def change
    change_column :contacts, :salutation, 'integer USING CAST(salutation AS integer)'
  end
end
