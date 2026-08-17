class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy change_status]

  def index
    @tasks    = TaskSearchQuery.new(policy_scope(Task), params).call
                               .includes(:creator, :assignee, :project)
                               .order(created_at: :desc)
    @projects = policy_scope(Project).order(:name)
    @users    = policy_scope(User).order(:first_name, :last_name)
  end

  def show
    authorize @task
  end

  def new
    @task = Task.new
    authorize @task
    load_form_collections
  end

  def create
    @task = Task.new(permitted_attributes(Task))
    @task.creator = current_user
    authorize @task

    if @task.save
      redirect_to tasks_path, notice: "Tâche créée avec succès."
    else
      load_form_collections
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @task
    load_form_collections
  end

  def update
    authorize @task

    if @task.update(permitted_attributes(@task))
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to tasks_path, notice: "Tâche mise à jour avec succès." }
      end
    else
      load_form_collections
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @task
    @task.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@task) }
      format.html { redirect_to tasks_path, notice: "Tâche supprimée avec succès." }
    end
  end

  def change_status
    authorize @task, :update?

    if Task.statuses.key?(params[:status])
      @task.update(status: params[:status])
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to tasks_path, notice: "Statut mis à jour." }
      end
    else
      redirect_to tasks_path, alert: "Statut invalide."
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def load_form_collections
    @projects = policy_scope(Project).order(:name)
    @users = policy_scope(User).order(:first_name, :last_name)
  end
end
