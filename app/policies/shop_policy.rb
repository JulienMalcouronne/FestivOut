class ShopPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    user.admin
  end

  def create?
    user.admin
  end
end
