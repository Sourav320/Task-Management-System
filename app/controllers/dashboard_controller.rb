class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    if admin_user?
      admin_dashboard_data
    else
      user_dashboard_data
    end
  end

  private

  def admin_user?
    current_user.roles.exists?(name: "Admin")
  end

  def admin_dashboard_data
    @pending_count     = TaskAssignment.pending.joins(:task).where(tasks: { is_delete: false }).count
    @in_progress_count = TaskAssignment.in_progress.joins(:task).where(tasks: { is_delete: false }).count
    @completed_count   = TaskAssignment.completed.joins(:task).where(tasks: { is_delete: false }).count
  end

  def user_dashboard_data
    assignments = current_user.task_assignments.joins(:task).where(tasks: { is_delete: false })

    @pending_count     = assignments.pending.count
    @in_progress_count = assignments.in_progress.count
    @completed_count   = assignments.completed.count
  end
end
