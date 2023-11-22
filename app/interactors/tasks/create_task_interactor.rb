class Tasks::CreateTaskInteractor
    include Interactor
    include Panko

    def call
        task = Task.new(context.task_params)

        if task.save
            serialized_task = TaskSerializer.new.serialize_to_json(task)
            context.task_data = serialized_task
        else
            context.fail!(errors: task.errors)
        end
    end
end