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

  def completion_percentage
    return 0 if tasks.empty?
    completed = tasks.count { |t| t.completed? }
    ((completed.to_f / tasks.size) * 100).round
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
