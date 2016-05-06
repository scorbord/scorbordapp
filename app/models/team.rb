class Team < ActiveRecord::Base
  has_many :members, dependent: :destroy, class_name: "Membership"
  has_many :users, :through => :memberships
end
