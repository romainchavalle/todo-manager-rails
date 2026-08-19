class Project < ApplicationRecord
  enum :status, { active: 0, archived: 1 }, default: :active

  belongs_to :creator, class_name: "User"
  has_many :tasks, dependent: :nullify

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :color, presence: true

  scope :active, -> { where(status: :active) }
  scope :archived, -> { where(status: :archived) }
  scope :search, ->(q) {
    where("name ILIKE :q OR description ILIKE :q", q: "%#{q}%")
  }

  def total_effort_points
    tasks.sum(&:complexity_points)
  end

  def completed_effort_points
    tasks.select(&:completed?).sum(&:complexity_points)
  end

  def remaining_effort_points
    total_effort_points - completed_effort_points
  end

  def completion_percentage
    return 0 if total_effort_points.zero?
    ((completed_effort_points.to_f / total_effort_points) * 100).round
  end

  def total_tasks_count
    tasks.size
  end

  def completed_tasks_count
    tasks.count { |t| t.completed? }
  end

  def pending_tasks_count
    tasks.count { |t| !t.completed? }
  end
end
