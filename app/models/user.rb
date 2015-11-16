class User < ActiveRecord::Base
  has_many :ideas
  has_many :idea_members
  has_many :idea_memberships, through: :idea_members, source: :user

  has_secure_password

  validates :username, :email, presence: true, uniqueness: true
end
