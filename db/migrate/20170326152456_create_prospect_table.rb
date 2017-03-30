class CreateProspectTable < ActiveRecord::Migration
  def change
    create_table :prospects do |t|
      t.integer :college_team_id
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :email
      t.integer :hs_grad_year
      t.string :cell_phone
      t.string :twitter
      t.string :facebook
      t.string :instagram
      t.string :snapchat
      t.string :home_city
      t.string :home_state
      t.string :intended_major
      t.string :club_team_name
      t.string :club_team_city
      t.string :club_team_state
      t.string :high_school_name
      t.string :high_school_city
      t.string :high_school_state
      t.text :notes
      t.datetime :birthday
      t.string :dominant_foot
    end
  end
end
