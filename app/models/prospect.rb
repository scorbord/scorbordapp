class Prospect < ActiveRecord::Base
	belongs_to :college_team, class_name: 'Team'
	has_many :contacts
	has_many :coaches, class_name: 'Coach', table_name: 'coaches'

	default_scope { order("last_name ASC") }

end
