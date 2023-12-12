require 'test_helper'

class ArchiveTaskTest < ActiveSupport::TestCase
    test "successfully updates task with correct params" do
        mock_task = Task.create!(id: 1, is_deleted: false, description: "Mock Task", priority: "high", due_date: Date.today)

        task = Task.find_by(id: 1)

        result = Tasks::ArchiveTask.call(task: task)

        assert result.success?
        assert result.task.is_deleted
    end

    test "fails to update task with no task provided" do
        task = Task.find_by(id: 1)

        result = Tasks::UpdateTask.call(task: task)

        assert_not result.success?
        assert_not_nil result.errors
    end
end