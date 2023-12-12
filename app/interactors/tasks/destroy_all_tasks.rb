class Tasks::DestroyAllTasks
    include Interactor

  def call
    tasks_to_be_deleted = context.tasks
    destroyed_tasks = Task.destroy(tasks_to_be_deleted.ids)

    if destroyed_tasks
      context.tasks = destroyed_tasks
    else
      context.fail!(errors: "Tasks delete failed")
    end
  end
end