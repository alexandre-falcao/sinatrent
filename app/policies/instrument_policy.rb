class InstrumentPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def edit?
    update?
  end

  def update?
    record.user_id == user.id
  end
end
