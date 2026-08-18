class ProjectPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.manager?
        scope.all
      else
        scope.active
      end
    end
  end

  def index?
    true
  end

  def show?
    user.manager? || record.active?
  end

  def create?
    user.manager?
  end

  def new?
    create?
  end

  def update?
    user.manager?
  end

  def edit?
    update?
  end

  def destroy?
    user.manager?
  end

  def permitted_attributes
    %i[name description color status]
  end
end
