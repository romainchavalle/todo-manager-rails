class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]

  def index
    @projects = ProjectSearchQuery.new(policy_scope(Project), params).call
                                 .includes(:creator, :tasks)
                                 .order(created_at: :desc)
  end

  def show
    authorize @project
    @tasks = policy_scope(@project.tasks).includes(:creator, :assignee, :project).order(created_at: :desc)
  end

  def new
    @project = Project.new(color: "#4f46e5")
    authorize @project
  end

  def create
    @project = Project.new(permitted_attributes(Project))
    @project.creator = current_user
    authorize @project

    if @project.save
      redirect_to project_path(@project), notice: "Projet créé avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @project
  end

  def update
    authorize @project

    if @project.update(permitted_attributes(@project))
      redirect_to project_path(@project), notice: "Projet mis à jour avec succès."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @project
    @project.destroy
    redirect_to projects_path, notice: "Projet supprimé avec succès."
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end
end
