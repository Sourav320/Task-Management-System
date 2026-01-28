class Task < ApplicationRecord
  has_many :task_assignments, dependent: :destroy
  has_many :users, through: :task_assignments

  validates :title, presence: true

  attr_accessor :user_ids

end
