class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    cannot :read, :all
    # return unless user.present?

    can :manage, [Food, Recipe], user_id: user.id if user.present?
    # can :create, :all
    # can :destroy, :all, user_id: user.id
  end
end
