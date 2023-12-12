require 'test_helper'

class UpdateTaskFlowTest < ActiveSupport::TestCase
    test "#call all required interactors" do
        assert_equal Tasks::UpdateTaskFlow.organized, [
            Tasks::FindTask,
            Tasks::UpdateTask
        ]
    end
end