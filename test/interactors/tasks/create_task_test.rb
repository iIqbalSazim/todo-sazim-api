require "test_helper"

class Tasks::CreateTaskTest < ActiveSupport::TestCase
    test 'creates a new task with valid parameters' do
        task_params = { description: 'New Task', priority: 'high', is_completed: false, is_deleted: false, due_date: Date.today }

        expected_response = { description: 'New Task', priority: 'high', is_completed: false, is_deleted: false, due_date: Date.today }

        result = Tasks::CreateTask.call(task_params: task_params)

        assert result.success?
        assert_equal expected_response[:description], result.task_data.description
        assert_equal expected_response[:priority], result.task_data.priority
        assert_equal expected_response[:is_completed], result.task_data.is_completed
        assert_equal expected_response[:is_deleted], result.task_data.is_deleted
    end

    test 'does not create a new task with no parameters' do
        result = Tasks::CreateTask.call(task_params: {})

        assert_not result.success?
        assert_not_nil result.errors
    end
end