class Tasks::DestroyAllTasksFlow 
    include Interactor::Organizer

    organize Tasks::FindTasks,
             Tasks::DestroyAllTasks
end
