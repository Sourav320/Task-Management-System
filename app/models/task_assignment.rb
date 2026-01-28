class TaskAssignment < ApplicationRecord
  belongs_to :task
  belongs_to :user

  enum status: {
    pending: 0,
    in_progress: 1,
    completed: 2
  }

  before_validation :set_start_date, on: :create

  validates :status, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[
      id
      task_id
      user_id
      status
      start_date
      due_date
      completed_at
      created_at
      updated_at
    ]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[task user]
  end

  private

  def set_start_date
    self.start_date ||= Date.current
  end
end
