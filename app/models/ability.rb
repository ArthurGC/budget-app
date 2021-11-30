class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, User

    return unless user.present?

    can :manage, Group, author_id: user.id
    can :manage, Purchase, author_id: user.id
  end
end
