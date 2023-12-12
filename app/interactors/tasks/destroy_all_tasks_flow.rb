class Tasks::DestroyAllTasksFlow 
    include Interactor::Organizer

    organize Tasks::SetTaskType,
             Tasks::FindTasks,
             Tasks::DestroyAllTasks
end
