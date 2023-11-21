class Tasks::DestroyAllTasksInteractor
    include Interactor

    def call
        type = context.type
        if type == "completed"
            completed_tasks = Task.where(is_completed: true)
            Task.destroy(completed_tasks.ids)
        elsif type == "archived"
            archived_tasks = Task.where(is_deleted: true)
            Task.destroy(archived_tasks.ids)
        end
    end
end