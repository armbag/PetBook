class BookingPolicy < ApplicationPolicy

  def new?
    user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
