class Tasks::ArchiveTask
    include Interactor

    def call
        task = context.task
        if task
            task.update(is_deleted: true)
        else
            context.fail!(errors: "Something went wrong. Delete failed.")
        end
    end
end