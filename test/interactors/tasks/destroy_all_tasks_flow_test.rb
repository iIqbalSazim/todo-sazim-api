require "test_helper"

class Tasks::DestroyAllTasksFlowTest < ActiveSupport::TestCase
  test "#call all required interactors" do
    assert_equal Tasks::DestroyAllTasksFlow.organized, [
      Tasks::FindTasks,
      Tasks::DestroyAllTasks
    ]
  end
end