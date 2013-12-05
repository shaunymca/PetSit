class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :basic or user.has_role? :standard or user.has_role? :plus or user.has_role? :advanced or user.has_role? :premier
      can :manage, [Client, ClientPrice, DefaultPrice, Invoice, VisitBlock, Visit]
    else user.has_role? :walker
      can :read, Visit
    end
  end
end