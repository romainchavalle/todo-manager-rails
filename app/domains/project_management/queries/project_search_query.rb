class ProjectSearchQuery
  attr_reader :relation, :params

  def initialize(relation = Project.all, params = {})
    @relation = relation
    @params = params
  end

  def call
    scoped = relation
    scoped = scoped.where(status: params[:status]) if params[:status].present? && Project.statuses.key?(params[:status])
    scoped = scoped.search(params[:q])             if params[:q].present?
    scoped
  end
end
