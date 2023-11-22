class ArchiveTaskFlow
    include Interactor::Organizer

    organize Shared::SetTaskInteractor, Tasks::ArchiveTaskInteractor
end