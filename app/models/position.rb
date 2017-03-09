class Position < ActiveRecord::Base
	has_many :position_teams
	has_many :teams, :through => :position_teams

	has_many :units_coached, class_name: 'Unit', foreign_key: 'coach_position_id'
	belongs_to :unit

	default_scope { order('id ASC') }

	enum sport: {
		football: 1,
		soccer: 2
	}

	enum side: {
		offense: 1,
		defense: 2,
		special_teams: 3,
		midfield: 4
	}

	enum position_type: {
		coach: 1,
		player: 2
	}
end
