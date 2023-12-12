require 'test_helper'

class UpdateTaskTest < ActiveSupport::TestCase
    test "successfully updates task with correct params" do
        mock_task = Task.create!(id: 1, description: "Mock Task", priority: "high", due_date: Date.today)

        task = Task.find_by(id: 1)

        task_params = {description: "Mock updated task"}

        result = Tasks::UpdateTask.call(task: task, task_params: task_params)

        assert result.success?
        assert_not_nil result.task_data
        assert_not_equal mock_task.description, result.task_data.description
        assert_equal task.description, result.task_data.description
    end

    test "fails to update task with no task in database with corresponding id" do
        task = Task.find_by(id: 1)

        task_params = {description: "Mock updated task"}

        result = Tasks::UpdateTask.call(task: task, task_params: task_params)

        assert_not result.success?
        assert_not_nil result.errors
    end
end