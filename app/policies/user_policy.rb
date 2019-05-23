class UserPolicy < ApplicationPolicy

  def show?
    user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
