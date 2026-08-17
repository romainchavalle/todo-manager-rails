class Task < ApplicationRecord
  enum :status, { todo: 0, in_progress: 1, completed: 2 }, default: :todo
  enum :priority, { low: 0, medium: 1, high: 2, urgent: 3 }, default: :medium

  belongs_to :creator, class_name: "User"
  belongs_to :assignee, class_name: "User", optional: true
  belongs_to :project, class_name: "Project", optional: true

  validates :title, presence: true

  scope :by_status, ->(status) { where(status: statuses[status]) if status.present? && statuses.key?(status) }
  scope :by_priority, ->(priority) { where(priority: priorities[priority]) if priority.present? && priorities.key?(priority) }
  scope :by_project, ->(project_id) { where(project_id: project_id) if project_id.present? }
  scope :by_assignee, ->(assignee_id) { where(assignee_id: assignee_id) if assignee_id.present? }
  scope :search, ->(query) { where("title ILIKE :q OR description ILIKE :q", q: "%#{query}%") if query.present? }
end
