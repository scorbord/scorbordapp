require 'phone_sanitizer'

class Member < ActiveRecord::Base
	extend PhoneSanitizer
	belongs_to :person
	has_one :user, :through => :person
	belongs_to :team

	has_many :member_position_teams
	has_many :position_teams, :through => :member_position_teams
	has_many :positions, :through => :position_teams
	has_many :contacts, as: :relatable

	enum role: {
		coach: 0,
		player: 1,
		manager: 2
	}

	attr_accessor :heightft
	attr_accessor :heightin

	sanitize(:cell_phone)

	def first_name
		self.person.first_name
	end

	def last_name
		self.person.last_name
	end
end
