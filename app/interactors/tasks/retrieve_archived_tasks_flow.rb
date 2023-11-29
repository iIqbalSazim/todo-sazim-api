class Tasks::RetrieveArchivedTasksFlow
    include Interactor::Organizer

    organize Tasks::FindTasks,
             Tasks::RetrieveArchivedTasks
end