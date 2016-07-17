require 'phone_sanitizer'

class Member < ActiveRecord::Base
	extend PhoneSanitizer
	belongs_to :user
	belongs_to :team

	attr_accessor :heightft
	attr_accessor :heightin

	sanitize(:cell_phone)

end
