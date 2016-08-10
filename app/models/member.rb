require 'phone_sanitizer'

class Member < ActiveRecord::Base
	extend PhoneSanitizer
	belongs_to :person
	has_one :user, :through => :person
	belongs_to :team

	attr_accessor :heightft
	attr_accessor :heightin

	sanitize(:cell_phone)

end
