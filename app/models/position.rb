class Position < ActiveRecord::Base
	has_many :position_teams
	has_many :teams, :through => :position_teams

	has_many :units_coached, class_name: 'Unit', foreign_key: 'coach_position_id'
	belongs_to :unit
end