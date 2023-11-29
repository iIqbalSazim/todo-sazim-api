class Tasks::ArchiveTask
    include Interactor

    def call
        task = context.task
        context.fail!(errors: "Something went wrong. Delete failed.") unless task.update(is_deleted: true)
    end
end