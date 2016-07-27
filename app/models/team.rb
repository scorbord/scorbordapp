class Team < ActiveRecord::Base
  has_many :members, dependent: :destroy
  has_many :users, :through => :members
	belongs_to :program
	has_one :school, :through => :program
end
