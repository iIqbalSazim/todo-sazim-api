class Tasks::ArchiveTaskInteractor
    include Interactor

    def call
        task = context.task
        task.update(is_deleted: true)
    end
end