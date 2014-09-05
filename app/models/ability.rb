class Ability
  include CanCan::Ability

  def initialize(user)
    #1/0
    # Define abilities for the passed in user here. For example:
    user ||= User.new # guest user (not logged in)

    # if User.exists?(user)
    can :manage, :all
    # else
    #   cannot :see, :admin_toolbox
    #   can :read, :all
    # end

    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
