class Tasks::DestroyAllTasks
    include Interactor

    def call
        if context.type == "completed"
            completed_tasks = context.tasks
            context.fail!(errors: "Something went wrong. Completed tasks delete failed.") unless Task.destroy(completed_tasks.ids)
        elsif context.type == "archived"
            archived_tasks = context.tasks
            context.fail!(errors: "Something went wrong. Archived tasks delete failed.") unless Task.destroy(archived_tasks.ids)
        end
    end
end