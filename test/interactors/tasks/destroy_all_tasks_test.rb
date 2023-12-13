require "test_helper"

class Tasks::DestroyAllTasksTest < ActiveSupport::TestCase
  test "successfully deleted tasks with correct params passed" do
    task1 = Task.create(description: "Task 1", due_date: "2023-12-27 18:00:00", is_completed: false, priority: "medium", is_deleted: true)
    task2 = Task.create(description: "Task 2", due_date: "2023-12-21 18:00:00", is_completed: false, priority: "low", is_deleted: true)

    tasks = Task.where({ is_deleted: true })

    Task.expects(:destroy).with([task1.id, task2.id]).returns([])

    result = Tasks::DestroyAllTasks.call(tasks: tasks)

    assert result.success?
  end

  test "failed to delete tasks with no params passed" do
    result = Tasks::DestroyAllTasks.call

    Task.expects(:destroy).never

    assert_not result.success?
    assert_not_nil result.errors
  end
end