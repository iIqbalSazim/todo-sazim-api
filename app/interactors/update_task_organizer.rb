class UpdateTaskOrganizer
    include Interactor::Organizer

    organize Shared::SetTaskInteractor, Tasks::UpdateTaskInteractor
end