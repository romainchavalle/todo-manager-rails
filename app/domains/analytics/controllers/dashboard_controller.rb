class DashboardController < ApplicationController
  def show
    authorize :dashboard, :show?

    @projects = policy_scope(Project).active.includes(:tasks).order(:name)
    @employees = User.employee.includes(assigned_tasks: :project).order(:first_name, :last_name)
    @active_tasks = policy_scope(Task).where.not(status: :completed).includes(:assignee, :project)
    @priority_tasks = @active_tasks.select { |t| t.urgent? || t.high? }
                                    .sort_by { |t| t.urgent? ? 0 : 1 }
    @total_remaining_effort = @active_tasks.sum(&:complexity_points)
  end
end
