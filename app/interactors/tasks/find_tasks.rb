class Tasks::FindTasks
    include Interactor

    def call
        if context.task_params
            tasks = Task.where(context.task_params)
            context.tasks = tasks
        else
            context.fail!(errors: "Unable to find tasks")
        end
    
    end
end