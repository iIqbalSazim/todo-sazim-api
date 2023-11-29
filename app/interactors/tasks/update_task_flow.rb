class Tasks::UpdateTaskFlow
    include Interactor::Organizer

    organize Tasks::FindTask, 
             Tasks::UpdateTask
end