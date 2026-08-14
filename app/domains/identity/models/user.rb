class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, { employee: 0, manager: 1 }, default: :employee

  validates :first_name, :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}".strip
  end
end
