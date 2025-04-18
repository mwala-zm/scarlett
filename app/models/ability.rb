# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
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
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
    if user.has_role? :admin
      can :access, :rails_admin # only allow admin users to access Rails Admin
      can :read, :dashboard # allow access to dashboard
      can :manage, :all
    elsif user.has_role? :sclt
      can :read, Field, user: { id: user.id }
      can :update, Field, user: { id: user.id }
      can(:update, User, user: { id: user.id })
      can :read, User, id: user.id
      can :destroy, User, user: { id: user.id }
    else
      cannot :manage, :all
    end
  end
end
