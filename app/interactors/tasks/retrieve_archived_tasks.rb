class Tasks::RetrieveArchivedTasks
    include Interactor

    def call
        archived_tasks = context.tasks
        if archived_tasks
            archived_tasks.update_all(is_deleted: false)
        else
            context.fail!(errors: "Something went wrong. Retrieve all tasks failed.")
        end
    end
end