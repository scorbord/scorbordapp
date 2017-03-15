class UserBuilder

	def initialize(invitation)
		@invitation = invitation
	end

	def setup_user_from_invite
		User.new(invitation_params) do |user|
			user.password = SecureRandom.hex(20)
			user.password_confirmation = user.password
		end
	end

	def invitation_params
		@invitation.attributes.slice('first_name', 'last_name', 'email')
	end

end
