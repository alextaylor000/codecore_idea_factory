class User < ActiveRecord::Base
  has_many :ideas

  # membership
  has_many :idea_members
  has_many :idea_memberships, through: :idea_members, source: :idea

  # likes
  has_many :likes
  has_many :liked_ideas, through: :likes, source: :idea

  has_secure_password

  validates :username, :email, presence: true, uniqueness: true
end
