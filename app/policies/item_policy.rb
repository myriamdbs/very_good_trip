class ItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def update?
    true
  end

  def destroy?
    update?
  end
end
