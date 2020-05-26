class VendorPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def update?
      record.user == user
    end

    def destroy?
      record.user == user
    end
  end
end
