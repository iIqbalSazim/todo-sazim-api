require 'test_helper'

class FindTaskTest < ActiveSupport::TestCase
    test "successfully finds task with correct params" do
        new_mock_task = Task.create!(id:1, description: "Mock Task", priority: "high", due_date: Date.today)

        result = Tasks::FindTask.call(id: 1)

        assert result.success?
        assert_not_nil result.task
    end

    test "fails to find task with incorrect params" do
        new_mock_task = Task.create!(id:1, description: "Mock Task", priority: "high", due_date: Date.today)

        result = Tasks::FindTask.call(id: 2)

        assert_not result.success?
        assert_not_nil result.errors
    end
end