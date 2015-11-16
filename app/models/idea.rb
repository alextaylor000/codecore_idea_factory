class Idea < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, uniqueness: { scope: :user_id }
  validates :description, presence: true

  def creator_username
    creator_user.username
  end

  def creator_user
    user
  end
end
