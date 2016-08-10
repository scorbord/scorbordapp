class AddPersonToMember < ActiveRecord::Migration
  def change
    add_reference :members, :person, index: true, foreign_key: true
  end
end
