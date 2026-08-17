class TaskPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.manager?
        scope.all
      else
        scope.where(assignee_id: user.id)
      end
    end
  end

  def index?
    true
  end

  def show?
    user.manager? || record.assignee_id == user.id
  end

  def create?
    user.manager?
  end

  def new?
    create?
  end

  def update?
    user.manager? || record.assignee_id == user.id
  end

  def edit?
    update?
  end

  def destroy?
    user.manager?
  end

  def change_status?
    update?
  end

  def permitted_attributes
    if user.manager?
      %i[title description status priority assignee_id project_id]
    else
      %i[status]
    end
  end
end
