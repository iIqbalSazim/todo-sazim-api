require "test_helper"

class Tasks::IndexTest < ActiveSupport::TestCase
  test "successfully gets all tasks" do
    mock_data = [
      { id: 1, description: "Task 1", due_date: Date.today, is_completed: false, priority: "medium", is_deleted: false },
      { id: 2, description: "Task 2", due_date: Date.tomorrow, is_completed: true, priority: "high", is_deleted: false }
    ]

    Task.stubs(:all).returns(mock_data)

    result = Tasks::Index.call

    assert result.success?
    assert result.tasks
    assert_equal mock_data, result.tasks
    end

    test "fails when unable to get tasks" do
        Task.stubs(:all).returns(nil)

        result = Tasks::Index.call

        assert_not result.success?
        assert_not_nil result.errors
    end
end