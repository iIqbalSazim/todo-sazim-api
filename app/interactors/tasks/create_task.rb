class Tasks::CreateTask
    include Interactor

    def call
        task = Task.new(context.task_params)

        if task.save
            context.task_data = task
        else
            context.fail!(errors: task.errors)
        end
    end
end