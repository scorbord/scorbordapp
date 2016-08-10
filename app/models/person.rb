class Person < ActiveRecord::Base
	belongs_to :user
	has_many :memberships, class_name: "Member"

	def formatted_height
		unless self.height < 30
			"#{self.height / 12} ft. #{self.height % 12} in."
		end
	end

	def formatted_weight
		unless self.height < 50
			"#{self.weight} lbs."
		end
	end

end
