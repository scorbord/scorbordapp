class Prospect < ActiveRecord::Base
	belongs_to :college_team, class_name: 'Team'
	has_many :contacts, as: :relatable
	has_many :coaches, class_name: 'Coach', table_name: 'coaches'
	has_many :highlights

	default_scope { order("last_name ASC") }

end
