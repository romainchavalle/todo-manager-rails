class UserPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.manager?
        scope.all
      else
        scope.where(id: user.id)
      end
    end
  end

  def index?
    user.manager?
  end

  def show?
    user.manager? || record.id == user.id
  end
end
