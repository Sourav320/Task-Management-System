class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: %i[show edit update destroy]

  def index
    base_scope = TaskAssignment
                  .includes(:task, :user)
                  .where(tasks: { is_delete: false })
                  .references(:tasks)

    # Role-based visibility
    unless current_user.roles.last.name.downcase == "admin"
      base_scope = base_scope.where(user_id: current_user.id)
    end

    # Ransack search
    @q = base_scope.ransack(params[:q])

    @task_assignments = @q
                          .result
                          .order(created_at: :desc)
                          .paginate(page: params[:page], per_page: 10)

    # For filter dropdown
    @users = User.where(is_active: true, is_delete: false)
  end




  def show
    @task = Task.find_by(id: params[:id])
    @task_assignments = @task.task_assignments.includes(:user)
  end

  def new
    @task = Task.new
    @users = User.where(is_active: true, is_delete: false)
    @assignment = nil
  end

  def create
    @task = Task.new(
      title: task_params[:title],
      description: task_params[:description]
    )
    @users = User.where(is_active: true, is_delete: false)

    if @task.save
      create_task_assignments
      redirect_to tasks_path, notice: "Task created successfully"
    else
      render :new
    end
  end

  def edit
    @users = User.where(is_active: true, is_delete: false)

    @assignment = @task&.task_assignments&.first

    @task.user_ids = @task.users.pluck(:id)
  end

  def update
    @users = User.where(is_active: true, is_delete: false)

    if @task.update(
      title: task_params[:title],
      description: task_params[:description]
    )
      @task.task_assignments.destroy_all
      create_task_assignments
      redirect_to tasks_path, notice: "Task updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @task.update(is_delete: true)
    flash[:success] = "Task deleted successfully"
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :status, :start_date, :due_date, user_ids: [])
  end

  def create_task_assignments
    return if task_params[:user_ids].blank?

    task_params[:user_ids].reject(&:blank?).each do |user_id|
      assignment = TaskAssignment.create!(
        task_id: @task.id,
        user_id: user_id,
        status: task_params[:status] || "pending",
        start_date: task_params[:start_date] || Date.current,
        due_date: task_params[:due_date]
      )

      TaskMailer.task_assigned(assignment).deliver_later
    end
  end

end
