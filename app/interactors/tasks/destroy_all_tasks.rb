class Tasks::DestroyAllTasks
    include Interactor

  def call
    tasks_to_be_deleted = context.tasks

    if tasks_to_be_deleted.present?
      destroyed_tasks = Task.destroy(tasks_to_be_deleted.ids)
      if destroyed_tasks
        context.tasks = destroyed_tasks
      else
        context.fail!(errors: "Tasks delete failed")
      end
    else
      context.fail!(errors: "No tasks provided for deletion")
    end
  end
end