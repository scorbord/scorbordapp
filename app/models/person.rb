class Person < ActiveRecord::Base
	belongs_to :user
	has_many :memberships, class_name: "Member"

	attr_accessor :heightft
	attr_accessor :heightin

	def formatted_height
		if self.height? && self.height > 30
			"#{self.height / 12} ft. #{self.height % 12} in."
		end
	end

	def formatted_weight
		if self.weight? && self.height > 50
			"#{self.weight} lbs."
		end
	end

	def first_name=(name)
		write_attribute(:first_name, name)
	end

	def first_name
		read_attribute(:first_name)
		#self.user ? self.user.first_name : read_attribute(:first_name)
	end

end
