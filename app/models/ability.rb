
# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

      cannot :read, :all
      return unless user.present?
  
      can :read, [Food, Recipe]
      can :create, :all
      can :destroy, :all, user_id: user.id
    end


    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.

    

    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
