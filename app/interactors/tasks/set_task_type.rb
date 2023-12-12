class Tasks::SetTaskType
    include Interactor

    def call
        if context.type == "completed"
            context.task_params = { is_completed: true }
        elsif context.type == "archived"
            context.task_params = { is_deleted: true }
        else
            context.fail!(errors: "Unable to set task type") 
        end
    end
end