require 'test_helper'

class TaskSerializerTest < ActiveSupport::TestCase
  test 'should render correct attributes' do
    task_data = {
      id: 1,
      description: 'Sample Task',
      priority: 'high',
      created_at: Time.now,
      due_date: Date.tomorrow,
      is_completed: false,
      is_deleted: true
    }

    serialized_object = TaskSerializer.new.serialize(OpenStruct.new(task_data))
    parsed_object = JSON.parse(serialized_object.to_json)

    assert_equal task_data[:id], parsed_object['id']
    assert_equal task_data[:description], parsed_object['description']
    assert_equal task_data[:priority], parsed_object['priority']
    assert_equal task_data[:created_at].to_s, Time.parse(parsed_object['created_at']).to_s
    assert_equal task_data[:due_date].to_s, parsed_object['due_date'].to_s
    assert_equal task_data[:is_completed], parsed_object['is_completed']
    assert_equal task_data[:is_deleted], parsed_object['is_deleted']
  end
end
