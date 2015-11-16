class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Idea do |idea|
      idea.user == user
    end

    can :manage, Comment do |comment|
      comment.user == user
    end

  end
end
