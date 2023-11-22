class TaskSerializer < Panko::Serializer
    attributes :id, :description, :priority, :created_at, :due_date, :is_completed, :is_deleted
end