require "test_helper"

class Tasks::RetrieveArchivedTasksFlowTest < ActiveSupport::TestCase
  test "#call all required interactors" do
    assert_equal Tasks::RetrieveArchivedTasksFlow.organized, [
      Tasks::FindTasks,
      Tasks::RetrieveArchivedTasks
    ]
  end
end