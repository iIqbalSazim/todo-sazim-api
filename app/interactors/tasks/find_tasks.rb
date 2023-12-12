class Tasks::FindTasks
    include Interactor

    def call
        tasks = Task.where(context.task_params)
        if tasks
            context.tasks = tasks
        else
            context.fail!(errors: "Unable to find tasks")
        end
    
    end
end