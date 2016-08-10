require 'phone_sanitizer'

class Member < ActiveRecord::Base
	extend PhoneSanitizer
	belongs_to :person
	has_one :user, :through => :person
	belongs_to :team

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
