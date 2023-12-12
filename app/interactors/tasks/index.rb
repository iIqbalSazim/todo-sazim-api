class Tasks::Index
    include Interactor

    def call
        tasks = Task.all

        if tasks
            context.tasks = tasks
        else
            context.fail!(errors: "Failed to fetch tasks")
        end
    end
end