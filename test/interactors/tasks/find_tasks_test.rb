require "test_helper"

class Tasks::FindTasksTest < ActiveSupport::TestCase
  test "successfully sets tasks with correct params passed" do
    params = { is_completed: true }

    Task.expects(:where).with(params).returns([])

    result = Tasks::FindTasks.call(task_params: params)

    assert result.success?
    assert_not_nil result.tasks
  end

  test "failed to set tasks when incorrect params passed" do
    result = Tasks::FindTasks.call({})

    assert_not result.success?
    assert_nil result.tasks
  end
end