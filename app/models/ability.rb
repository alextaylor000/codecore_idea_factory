class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Idea do |idea|
      idea.user == user
    end
  end
end
