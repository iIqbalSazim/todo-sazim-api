class Tasks::UpdateTask
    include Interactor

    def call
        task = context.task
        if task
            task_was_updated = task.update(context.task_params)
            context.task_data = task if task_was_updated
        else
            context.fail!(errors: "Failed to update task")
        end
    end
end