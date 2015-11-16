class User < ActiveRecord::Base
  has_many :ideas

  has_secure_password

  validates :username, :email, presence: true, uniqueness: true
end
