class FestivalPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

  def new?
    user.admin
  end

  def create?
    user.admin
  end

  def show?
    user.admin
  end

  def update?
    user.admin
  end

  def destroy?
    user.admin
  end
  end
end
