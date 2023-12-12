class Tasks::DestroyAllTasks
    include Interactor

    def call
        tasks_to_be_deleted = context.tasks
        context.fail!(errors: "Tasks delete failed") unless Task.destroy(tasks_to_be_deleted.ids)
    end
end