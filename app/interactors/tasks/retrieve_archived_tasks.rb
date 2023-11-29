class Tasks::RetrieveArchivedTasks
    include Interactor

    def call
        archived_tasks = context.tasks
        context.fail!(errors: "Something went wrong. Retrieve all tasks failed.") unless archived_tasks.update_all(is_deleted: false)
    end
end