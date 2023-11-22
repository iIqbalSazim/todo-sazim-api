class Tasks::UpdateTaskInteractor
    include Interactor
    include Panko

    def call
        task = context.task

        if task.update(context.task_params)
            serialized_task = TaskSerializer.new.serialize_to_json(task)
            context.task_data = serialized_task
        else
            context.fail!(errors: task.errors)
        end
    end
end