class ProjectPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.manager?
  end

  def update?
    user.manager?
  end

  def destroy?
    user.manager?
  end
end
