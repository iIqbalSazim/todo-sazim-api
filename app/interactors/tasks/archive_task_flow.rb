class Tasks::ArchiveTaskFlow
    include Interactor::Organizer

    organize Tasks::FindTask,
             Tasks::ArchiveTask
end