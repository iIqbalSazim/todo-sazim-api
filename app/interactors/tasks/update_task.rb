class Tasks::UpdateTask
    include Interactor

    def call
        task = context.task

        if task.update(context.task_params)
            context.task_data = task
        else
            context.fail!(errors: task.errors)
        end
    end
end