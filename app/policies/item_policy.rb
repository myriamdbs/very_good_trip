class ItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(member_id: { user_id: user.id })
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
end
