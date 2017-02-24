class Team < ActiveRecord::Base
  has_many :members, dependent: :destroy
  has_many :users, :through => :members
	belongs_to :program
	has_one :school, :through => :program
	has_many :position_teams, dependent: :destroy
	has_many :positions, :through => :position_teams

	has_many :team_units, dependent: :destroy
	has_many :units, :through => :team_units
	has_many :sides, -> { joins(:unit).where('units.unit_type = ?', 1)}, class_name: 'TeamUnit'
end
