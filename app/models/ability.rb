class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
	
	user ||= User.new # guest user (not logged in)
#		if user.admin?
#			can :manage, :all
#		else
#			can :read, :all
#	end
	
	can :show, User
	can [:create, :update, :destroy], User, :id => user.id

	can :manage, Identity, :user_id => user.id
	
	can :show, Reply do |reply|
		# fallback is to reject anyone else
		authorized = false
		
		authorized ||= true if reply.sender.try(:user) == user		
		authorized ||= true if reply.topic_owner == user		
		authorized ||= true if reply.public?
		
		authorized
	end
	
#	can :manage, Topic, :user_id => user.id
		
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
