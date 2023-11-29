class Tasks::FindTask
    include Interactor

    def call
        context.fail!(errors: "Task not found") unless context.task = Task.find(context.id)
    end
end