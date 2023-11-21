class Tasks::RetrieveArchivedTasksInteractor
    include Interactor

    def call
        archived_tasks = Task.where(is_deleted: true)
        archived_tasks.update_all(is_deleted: false)
    end
end