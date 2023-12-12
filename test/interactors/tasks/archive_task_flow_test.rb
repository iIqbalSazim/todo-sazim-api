require 'test_helper'

class ArchiveTaskFlowTest < ActiveSupport::TestCase
    test "#call all required interactors" do
        assert_equal Tasks::ArchiveTaskFlow.organized, [
            Tasks::FindTask,
            Tasks::ArchiveTask
        ]
    end
end