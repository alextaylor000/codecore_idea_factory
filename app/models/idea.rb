class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :idea_members
  has_many :member_users, through: :idea_members, source: :user

  validates :title, presence: true, uniqueness: { scope: :user_id }
  validates :description, presence: true

  def creator_username
    creator_user.username
  end

  def creator_user
    user
  end

  def comments_by_date
    comments.all.order("created_at DESC")
  end
end
