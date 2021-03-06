class PetPolicy < ApplicationPolicy

  def create?
    user
  end

  def show?
    true
  end

  def destroy?
    record.owner == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
