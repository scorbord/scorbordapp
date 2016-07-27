class AddSchoolToPrograms < ActiveRecord::Migration
  def change
    add_reference :programs, :school
  end
end
