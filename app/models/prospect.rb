class Prospect < ActiveRecord::Base
	belongs_to :college_team, class_name: 'Team'

	default_scope { order("last_name ASC") }

end
