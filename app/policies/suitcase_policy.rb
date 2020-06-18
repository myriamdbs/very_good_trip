class SuitcasePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.includes(:members).where(members: { user_id: user.id })
    end
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    true
  end

  def update?
    true
  end
end
