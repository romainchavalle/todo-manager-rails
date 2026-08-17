class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, { employee: 0, manager: 1 }, default: :employee

  has_many :created_projects, class_name: "Project", foreign_key: :creator_id, dependent: :destroy, inverse_of: :creator
  has_many :created_tasks, class_name: "Task", foreign_key: :creator_id, dependent: :destroy, inverse_of: :creator
  has_many :assigned_tasks, class_name: "Task", foreign_key: :assignee_id, dependent: :nullify, inverse_of: :assignee

  validates :first_name, :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}".strip
  end
end
