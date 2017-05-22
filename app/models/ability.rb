class Ability
  include CanCan::Ability

  def initialize(user)

    # Admin user can manage everything
    if user.has_role? :admin
      can :manage, :all

    # Agent can manage tickets
    elsif user.has_role? :agent
      can :manage, Ticket
      can :pdf_report

    # Customer can manage their own tickets
    elsif user.has_role? :customer
      can :manage, Ticket, user_id: user.id

    end

  end
  
end
