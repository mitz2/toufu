class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
    user ||= User.new
    member_ability(user)
    leader_ability(user)
    manager_ability(user)
  end
  # 一般社員の権限
  def member_ability(user)
    if user.member?
      can [:read,:update], User, id: user.id
      can :read, ActiveAdmin::Page, name: 'Dashboard'
      can :manage, Report
    end
  end
  # リーダーの権限
  def leader_ability(user)
    if user.leader?
      can :read, User
      can :update, User, id: user.id 
      can :update, User, role: User.roles[:member] 
      can :read, ActiveAdmin::Page, name: 'Dashboard'
      can :manage, Report
    end
  end
  # マネージャーの権限
  def manager_ability(user)
    if user.manager?
      can :manage, User
      can :manage, ActiveAdmin::Page, name: 'Dashboard'
      can :manage, Report
    end
  end
end
