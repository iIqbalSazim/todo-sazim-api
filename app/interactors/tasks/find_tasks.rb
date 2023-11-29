class Tasks::FindTasks
    include Interactor

    def call
       tasks = Task.where(context.task_params)
       context.tasks = tasks
    end
    
end