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
    if record.shared
      true
    else
      record.member.user_id == user.id
    end
  end
end
