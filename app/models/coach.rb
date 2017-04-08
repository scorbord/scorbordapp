class Coach < ActiveRecord::Base
	belongs_to :prospect

	enum program_kind: {
		'High School': 0,
		'Club Team': 1
	}
end
