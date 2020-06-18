class ItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def destroy?
    new?
  end

  def attached?
    true
    # record.member_id == 66
  end
end
