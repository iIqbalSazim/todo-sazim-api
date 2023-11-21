class Shared::SetTaskInteractor
    include Interactor

    def call
        context.task = Task.find(context.id)
        context.fail!(errors: "Task not found") unless context.task
    end
end