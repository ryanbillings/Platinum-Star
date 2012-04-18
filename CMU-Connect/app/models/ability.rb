class Ability
  include CanCan::Ability

  def initialize(user)
  
   
    user ||= User.new 
    
	
	
    if user.role? == "admin" 
          can :manage, :all
	  can :index, Complaint
          can :manage, Survey
          can :manage, ThemeChat
    elsif user.role? == "default"
      can :manage, :all
      cannot :manage, Complaint
      can :create, Complaint
      cannot :manage, Survey
      cannot :create, Survey
      can :show, Survey
      cannot :manage, ThemeChat
      can :show, ThemeChat
      cannot :index, ThemeChat
      cannot :index, User
      cannot :admin, :home
      cannot :reset_all, :home
    elsif user.role? == "banned"
	  cannot :manage, :all
      cannot :read, :all
      cannot :create, :all
      cannot :edit, :all
      cannot :destroy, :all
      cannot :index, :calendar
      cannot :manage, User
      cannot :reset_all, :home
     else
      can :create, User
      cannot :reset_all, :home
    end
      
  
  
  
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
