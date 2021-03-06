# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user 
      user.author? ? author_abilities : user_abilities
    else
      guest_abilities
    end
  end

  def author_abilities 
    can :manage, :all
  end

  def user_abilities
    guest_abilities
    can :manage, Comment
  end

  def guest_abilities
    can :read, :all
  end
end
