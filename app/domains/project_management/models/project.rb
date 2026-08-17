class Project < ApplicationRecord
  enum :status, { active: 0, archived: 1 }, default: :active

  belongs_to :creator, class_name: "User"
  has_many :tasks, dependent: :nullify

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :color, presence: true
end
