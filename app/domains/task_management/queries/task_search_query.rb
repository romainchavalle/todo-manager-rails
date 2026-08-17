class TaskSearchQuery
  attr_reader :relation, :params

  def initialize(relation = Task.all, params = {})
    @relation = relation
    @params = params
  end

  def call
    scoped = relation
    scoped = scoped.by_status(params[:status])       if params[:status].present?
    scoped = scoped.by_priority(params[:priority])   if params[:priority].present?
    scoped = scoped.by_project(params[:project_id])   if params[:project_id].present?
    scoped = scoped.by_assignee(params[:assignee_id]) if params[:assignee_id].present?
    scoped = scoped.search(params[:q])               if params[:q].present?
    scoped
  end
end
