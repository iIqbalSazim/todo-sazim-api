require "test_helper"

class Tasks::FindTasksTest < ActiveSupport::TestCase
  test "successfully sets tasks with correct params passed" do
    params = { is_completed: true }

    result = Tasks::FindTasks.call(params)

    assert result.success?
    assert_not_nil result.tasks
  end
end