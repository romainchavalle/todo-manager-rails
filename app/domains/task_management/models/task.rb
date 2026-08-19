class Task < ApplicationRecord
  enum :status, { todo: 0, in_progress: 1, completed: 2 }, default: :todo
  enum :priority, { low: 0, medium: 1, high: 2, urgent: 3 }, default: :medium
  enum :complexity, { simple: 0, medium: 1, complex: 2, heavy: 3 }, prefix: :complexity, default: :simple

  COMPLEXITY_POINTS = {
    "simple" => 1,
    "medium" => 2,
    "complex" => 3,
    "heavy" => 5
  }.freeze

  belongs_to :creator, class_name: "User"
  belongs_to :assignee, class_name: "User", optional: true
  belongs_to :project, optional: true

  validates :title, presence: true

  scope :by_status, ->(status) { where(status: status) }
  scope :by_priority, ->(priority) { where(priority: priority) }
  scope :by_complexity, ->(complexity) { where(complexity: complexity) }
  scope :by_project, ->(project_id) { where(project_id: project_id) }
  scope :by_assignee, ->(assignee_id) { where(assignee_id: assignee_id) }
  scope :search, ->(q) {
    where("title ILIKE :q OR description ILIKE :q", q: "%#{q}%")
  }

  def complexity_points
    COMPLEXITY_POINTS[complexity] || 1
  end
end
