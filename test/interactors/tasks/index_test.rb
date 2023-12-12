require "test_helper"

class Tasks::IndexTest < ActiveSupport::TestCase
    test "successfully gets all tasks" do
        result = Tasks::Index.call

        assert result.success?
    end

    test "fails when unable to get tasks" do
        Task.stubs(:all).returns(nil)

        result = Tasks::Index.call

        assert_not result.success?
        assert_not_nil result.errors
    end
end