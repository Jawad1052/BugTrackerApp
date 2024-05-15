class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new  # Guest user

    role = user.role.name

    if role == 'developer'
      can :create, Bug
      can :read, Bug
      can :update, Bug
      can :assign_bug, Bug

    elsif role == 'manager'
      can :create, Bug
      can :read, Bug
      can :update, Bug
      can :assign_bug, Bug

    else if role == 'admin'
           can :manage, :all
   end
    end
    end
end
