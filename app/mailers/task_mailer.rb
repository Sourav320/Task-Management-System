class TaskMailer < ApplicationMailer
  default from: "souravkarak00@gmail.com"

  def task_assigned(task_assignment)
    @task = task_assignment.task
    @user = task_assignment.user
    @due_date = task_assignment.due_date

    mail(
      to: @user.email,
      subject: "New Task Assigned: #{@task.title}"
    )
  end
end
