class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new
    can :manage, Goal, :user_id => user.id
  end
end