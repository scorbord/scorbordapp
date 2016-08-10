class User < ActiveRecord::Base
	attr_accessor :remember_token
	before_save { self.email = email.downcase }
	validates :first_name, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
			  format: { with: VALID_EMAIL_REGEX },
			  uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, presence: true, length: { minimum: 4 }, allow_nil: true

	has_one :person
	has_many :memberships, :through => :person, class_name: "Member"
	has_many :teams, :through => :memberships

	attr_accessor :heightft
	attr_accessor :heightin

	# Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

	# Returns a random token
	def User.new_token
		SecureRandom.urlsafe_base64
	end

	# Remembers a user in the database for use in persistent sessions.
	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end

	# Returns true if the given token matches the digest.
	def authenticated?(remember_token)
		return false if remember_digest.nil?
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end

	def is_team_admin?(team)
		self.memberships.where(team_id: team.id, admin: true).any?
	end

	def super_admin?
		Rails.configuration.admins.include?(email)
	end

	# Forgets a user
	def forget
		update_attribute(:remember_digest, nil)
	end

end
