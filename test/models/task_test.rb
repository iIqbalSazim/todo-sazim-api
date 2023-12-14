require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  should validate_presence_of(:description)
  should validate_presence_of(:priority)
  should validate_presence_of(:due_date)

  test 'task is created with validations' do
    valid_task = Task.new(
      description: 'Valid Description',
      priority: 'high',
      due_date: Date.today
    )
    assert valid_task.valid?
    assert_empty valid_task.errors

    invalid_task = Task.new(
      description: '',
      priority: 'high',
      due_date: Date.today
    )
    assert_not invalid_task.valid?
    assert_not_empty invalid_task.errors[:description]
  end
end