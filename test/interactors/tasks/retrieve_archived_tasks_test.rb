require "test_helper"

class Tasks::RetrieveArchivedTasksTest < ActiveSupport::TestCase
  test "successfully retrieved archived tasks with correct params passed" do
    task1 = Task.create(description: "Task 1", due_date: "2023-12-27 18:00:00", is_completed: false, priority: "medium", is_deleted: true)
    task2 = Task.create(description: "Task 2", due_date: "2023-12-21 18:00:00", is_completed: false, priority: "low", is_deleted: true)

    tasks = Task.where({ is_deleted: true })

    result = Tasks::RetrieveArchivedTasks.call(tasks: tasks)

    assert result.success?
    assert_empty Task.where({ is_deleted: true })
  end

  test "failed to retrieve archived tasks when no tasks are sent" do
    result = Tasks::RetrieveArchivedTasks.call

    Task.expects(:update_all).never

    assert_not result.success?
    assert_not_nil result.errors
  end
end