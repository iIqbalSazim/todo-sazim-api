class Tasks::FindTask
    include Interactor

  def call
    task = Task.find_by(id: context.id)

    if task
      context.task = task
    else
      context.fail!(errors: "Task not found")
    end
  end
end